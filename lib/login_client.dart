import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginClient {
  static const host = "http://localhost:3031/user";
  static dynamic fetchAll() async {
    final uri = Uri.parse(host);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }
}
