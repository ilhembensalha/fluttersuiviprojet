import 'dart:convert';
import 'package:suiviprojet/models/Activity.dart';
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
List<Activity> activitys;
  Project({
     this.id,
     this.name,
     this.description,
     this.createdAt,
     this.sprints,
     this.members,
     this.tasks,
     this.activitys,
  });
factory Project.fromJson(Map<String, dynamic> json) {
  List<dynamic> sprintsJson = json['sprints'];
  List<dynamic> membersJson = json['members'];
  List<dynamic> tasksJson = json['tasks'];
  List<dynamic> activitysJson = json['activitys'];

  List<Sprint> sprints = sprintsJson.map((sprint) => Sprint.fromJson(sprint)).toList();
  List<Membre> members = membersJson.map((member) => Membre.fromJson(member)).toList();
   List<Tache> tasks = tasksJson.map((task) => Tache.fromJson(task)).toList();
 List<Activity> activitys = activitysJson.map((activity) => Activity.fromJson(activity)).toList();

    if (json['tasks'] != null && json['tasks'] is List<dynamic>) {
      tasks= (json['tasks'] as List<dynamic>).map((taskJson) {
        if (taskJson is Map<String, dynamic>) {
          return Tache.fromJson(taskJson);
        } else {
          throw Exception('Invalid task format: $taskJson');
        }
      }).toList();
    }

   if (json['activitys'] != null && json['activitys'] is List<dynamic>) {
      activitys= (json['activitys'] as List<dynamic>).map((activitysJson) {
        if (activitysJson is Map<String, dynamic>) {
          return Activity.fromJson(activitysJson);
        } else {
          throw Exception('Invalid task format: $activitysJson');
        }
      }).toList();
    }

  return Project(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    createdAt: DateTime.parse(json['createdAt']),
    sprints: sprints,
    members: members,
    tasks: tasks,
    activitys: activitys,
  );
}

 Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'sprints': sprints.map((sprint) => sprint.toJson()).toList(),
      'members': members.map((member) => member.toJson()).toList(),
      'tasks': tasks.map((task) => task.toJson()).toList(),
       'activitys': tasks.map((activity) => activity.toJson()).toList(),
    };
  }
}
