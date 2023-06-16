import 'package:flutter/material.dart';
import 'package:login/entities/user.dart';
import 'package:login/login_client.dart';
import 'package:login/widgets/app_text_field.dart';

class NewUser extends StatefulWidget {
  NewUser({super.key});
  final formKey = GlobalKey<FormState>();
  final labelUsername = 'Nome do Usuário';
  final labelEmail = "E-mail do Usuário";
  final labelSenha = "Senha do usuário";
  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  String username = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AppTextField(
            labelText: widget.labelUsername,
            onValidate: (texto) {
              return null;
            },
            onSaved: (texto) {
              username = texto!;
            },
          ),
          AppTextField(
            labelText: widget.labelEmail,
            onValidate: (texto) {
              return null;
            },
            onSaved: (texto) {
              email = texto!;
            },
          ),
          AppTextField.pass(
            labelText: widget.labelSenha,
            onValidate: (texto) {
              return null;
            },
            onSaved: (texto) {
              password = texto!;
            },
          ),
          ElevatedButton(
              onPressed: () async {
                final isValid = widget.formKey.currentState!.validate();
                if (isValid) {
                  widget.formKey.currentState!.save();
                  final user = User(
                      id: '1',
                      username: username,
                      email: email,
                      password: password,
                      validated: true);
                  final status = await LoginClient.post(user.toMap());
                  Navigator.pop(context);
                }
              },
              child: const Text("Cadastrar"))
        ],
      ),
    );
  }
}
