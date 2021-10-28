import 'dart:convert';

import 'User.dart';
import 'package:http/http.dart' as http;

class UserManager {
  static Future<http.Response> createUser(String name, String email) {
    return http.post(
      Uri.parse('http://127.0.0.1:8000/api/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(new User(name, email).toJson()),
    );
  }

  static Future<User> getUser(String email) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/user/' + email),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
