import 'dart:convert';
import 'package:suiviprojet/models/Membre.dart';
import 'package:suiviprojet/models/Sprint.dart';
import 'package:suiviprojet/models/Tache.dart';

class Project {
  int id;
  String name;
  String description;
  DateTime createdAt;
  List<Sprint> sprints;
  List<Membre> members;
  List<Tache> tasks;

  Project({
     this.id,
     this.name,
     this.description,
     this.createdAt,
     this.sprints,
     this.members,
     this.tasks,
  });
factory Project.fromJson(Map<String, dynamic> json) {
  List<dynamic> sprintsJson = json['sprints'];
  List<dynamic> membersJson = json['members'];
  List<dynamic> tasksJson = json['tasks'];

  List<Sprint> sprints = sprintsJson.map((sprint) => Sprint.fromJson(sprint)).toList();
  List<Membre> members = membersJson.map((member) => Membre.fromJson(member)).toList();
  List<Tache> tasks = tasksJson.map((task) => Tache.fromJson(task)).toList();

  return Project(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    createdAt: DateTime.parse(json['createdAt']),
    sprints: sprints,
    members: members,
    tasks: tasks,
  );
}

 
}
