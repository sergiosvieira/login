import 'package:flutter/material.dart';
import 'package:login/screens/login.dart';
import 'package:login/screens/new_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const loginTitle = "Exemplo de Login";
  static const appBarTitle = "Título da Aplicação";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/home': (context) => const Center(
              child: Text("Seja bem-vindo"),
            ),
        '/newuser': (context) => Scaffold(appBar: AppBar(), body: NewUser()),
      },
      debugShowCheckedModeBanner: false,
      title: loginTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appBarTitle),
        ),
        body: const Login(),
      ),
    );
  }
}
