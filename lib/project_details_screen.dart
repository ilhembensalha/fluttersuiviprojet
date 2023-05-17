import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suiviprojet/models/Project.dart';
import 'package:suiviprojet/models/Tache.dart';
import 'package:http/http.dart' as http;

import 'SprintDetailsScreen.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Project project;

  ProjectDetailsScreen(this.project);

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              children: [
                Image.asset(
                  'lib/images/avatar.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.calendar_today,
                              color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Created on: ${widget.project.createdAt}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.person, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Users: ${widget.project.members.map((user) => '${user.firstName} ${user.lastName}').join(", ")}',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Backlog:',
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'les sprints:',
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.project.sprints.length,
              itemBuilder: (context, index) {
                final sprint = widget.project.sprints[index];
                return ListTile(
                  title: Text(sprint.nom),
                  subtitle: Text(sprint.description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SprintDetailsScreen(sprint),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Text(
            'les tasks:',
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.project.tasks.length,
              itemBuilder: (context, index) {
                final task = widget.project.tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing:   SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
  icon: const Icon(Icons.edit),
  onPressed: () {
    _editTask(task);
  },
),IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        widget.project.tasks.remove(task);
                      });
                      _saveProject();
                    },
                  ),
        ]),),);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(),
      ),
    );
  }

  void _showForm() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Create New Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              String title = _titleController.text;
              String description = _descriptionController.text;

              Tache newTask = Tache(
                id: 1, // Replace with the appropriate task ID
                title: title,
                description: description,
              );

              setState(() {
                widget.project.tasks.add(newTask);
              });
              _saveProject();

              _titleController.text = '';
              _descriptionController.text = '';

              Navigator.pop(context);
            },
            child: Text('Create'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveProject() async {
    String projectJson = jsonEncode(widget.project.toJson());

    final putResponse = await http.put(
      Uri.parse('http://localhost:3000/projects/${widget.project.id}'),
      headers: {'Content-Type': 'application/json'},
      body: projectJson,
    );

    if (putResponse.statusCode == 200) {
      print('Project updated');
    } else {
      print('Failed to update project');
    }
  }
  void _editTask(Tache task) {
  _titleController.text = task.title;
  _descriptionController.text = task.description;

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Edit Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(hintText: 'Description'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            String title = _titleController.text;
            String description = _descriptionController.text;

            setState(() {
              task.title = title;
              task.description = description;
            });
            _saveProject();

            _titleController.text = '';
            _descriptionController.text = '';

            Navigator.pop(context);
          },
          child: Text('Update'),
        ),
      ],
    ),
  );
}

}
