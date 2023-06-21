import 'package:flutter/material.dart';
import 'package:login/login_client.dart';

import '../entities/user.dart';

class Users extends StatelessWidget {
  const Users({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: LoginClient.fetchAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.waiting) {
          final records = snapshot.data?.toList();
          return ListView.builder(
            itemCount: records!.length,
            itemBuilder: (context, index) {
              User u = User.fromMap(records[index]);
              return ListTile(
                title: Text(u.username),
              );
            },
          );
        } else {
          return const Text("Carregando");
        }
      },
    );
  }
}
