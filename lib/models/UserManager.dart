import 'dart:async';
import 'dart:convert';
import 'User.dart';
import 'package:http/http.dart' as http;

class UserManager {
  static Future<User> createUser(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(new User(email).toJson()),
    );
    if (response.statusCode == 201) {
      User user = new User(email);
      user.name = name;

      return user;
    } else {
      throw Exception('Failed to create user.');
    }
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
      throw Exception('Failed to get user.');
    }
  }

  static Future<User> login(String email, String password) async {
    final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: <String, String>{
          'username': email,
          'password': password
        });

    if (response.statusCode == 200) {
      User user = new User(email);
      user.userId = jsonDecode(response.body)['user_id'];
      user.userAuthToken = jsonDecode(response.body)['token'];
      return user;
    } else {
      throw Exception('Failed to login.');
    }
  }
}
