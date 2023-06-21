import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginClient {
  static const host = "http://localhost:3031/user";
  static Future<dynamic> fetchAll() async {
    final uri = Uri.parse(host);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return [];
  }

  static post(Map<String, dynamic> user) async {
    final url = Uri.parse(host);
    final headers = {"Content-type": "application/json"};
    String json = jsonEncode(user);
    final response = await http.post(url, headers: headers, body: json);
  }
}
