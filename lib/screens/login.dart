import 'package:flutter/material.dart';
import 'package:login/login_client.dart';
import 'package:login/widgets/app_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  static const String emptyError = "Campo obrigatório";
  static const String lengthError = "Máximo 30 caracteres";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            labelText: "Username",
            onValidate: (value) {
              if (value!.isEmpty) return emptyError;
              if (value.length > 30) return lengthError;
              return null;
            },
            onSaved: (value) {
              username = value!;
            },
          ),
          AppTextField.pass(
            labelText: "Password",
            onSaved: (value) {
              password = value!;
            },
            onValidate: (value) {
              if (value!.isEmpty) return emptyError;
              if (value.length > 30) return lengthError;
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: () async {
                  final isValid = formKey.currentState!.validate();
                  if (isValid) {
                    formKey.currentState!.save();
                    final users = await LoginClient.fetchAll();
                    final user = users.firstWhere(
                      (obj) => obj['username'] == username,
                      orElse: () => {},
                    );
                    if (user.isNotEmpty) {
                      final isValidPassword = user['password'] == password;
                      if (isValidPassword) {
                        Navigator.pushNamed(context, '/home');
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Nome de usuário ou senha inválidos!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } else {
                      const snackBar = SnackBar(
                        content: Text('Nome de usuário ou senha inválidos!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                child: const Text("Entrar")),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/newuser');
              },
              child: Text("Cadastro"),
            ),
          )
        ],
      ),
    );
  }
}
