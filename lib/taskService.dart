import 'package:suiviprojet/User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suiviprojet/models/Tache.dart';

class UserService {
  static const API_URL = 'http://192.168.1.27:3000/tasks';

  Future<List<Tache>> fetchUsers() async {
    final response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      final tasks = json.decode(response.body) as List<dynamic>;

      return tasks.map((u) => Tache.fromJson(u)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}