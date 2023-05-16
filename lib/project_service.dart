import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suiviprojet/models/Project.dart';
import 'package:suiviprojet/models/Sprint.dart';

class ProjectService {
  static const API_URL = 'http://localhost:3000/projects';

  
  Future<List<Project>> fetchProjects() async {
    final response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      List<dynamic> projectsJson = json.decode(response.body) as List<dynamic>;
      List<Project> projects = projectsJson.map((project) => Project.fromJson(project)).toList();
      return projects;
    } else {
      throw Exception('Failed to fetch projects');
    }
  }

  Future<void> addProject(Project project) async {
    final projectJson = {
      'id': project.id,
      'name': project.name,
      'description': project.description,
      'createdAt': project.createdAt.toIso8601String(),
      'users': project.members.map((user) => user.toJson()).toList(),
    };

    final response = await http.post(
      Uri.parse(API_URL),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(projectJson),
    );

    if (response.statusCode == 201) {
      // Project added successfully
    } else {
      throw Exception('Failed to add project');
    }
  }
Future<List<Sprint>> fetchProjectSprints(int projectId) async {
    final response = await http.get(Uri.parse('$API_URL/$projectId'));

    if (response.statusCode == 200) {
     List<dynamic> sprintsJson = json.decode(response.body) as List<dynamic>;
      List<Sprint> sprints =
          sprintsJson.map((sprint) => Sprint.fromJson(sprint)).toList();
      return sprints;
    } else {
      throw Exception('Failed to fetch project sprints');
    }
  }

  
}
