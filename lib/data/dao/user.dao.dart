import 'dart:convert';

import 'package:flutter_app_architecture/data/models/user.model.dart';
import 'package:http/http.dart' as http;

class UserDao {
  static const _baseUrl = "https://api.example.com";

  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse("$_baseUrl/users"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return List.generate(
          jsonData.length, (index) => User.fromJson(jsonData[index]));
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<User?> getUserById(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl/users/$id"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return User.fromJson(jsonData);
    } else {
      return null;
    }
  }

  Future<void> createUser(User user) async {
    final response = await http.post(Uri.parse("$_baseUrl/users"),
        body: jsonEncode(user.toJson()),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode != 201) {
      throw Exception("Failed to create user");
    }
  }

  Future<void> updateUser(User user) async {
    final response = await http.put(Uri.parse("$_baseUrl/users/${user.id}"),
        body: jsonEncode(user.toJson()),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode != 200) {
      throw Exception("Failed to update user");
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/users/$id"));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete user");
    }
  }
}
