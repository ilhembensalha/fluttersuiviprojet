import 'package:flutter/material.dart';
import 'package:suiviprojet/BacklogButton.dart';
import 'package:suiviprojet/models/Project.dart';
import 'package:suiviprojet/models/Tache.dart';

import 'SprintDetailsScreen.dart';
import 'models/Sprint.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;
  Sprint sprint  ;
   ProjectDetailsScreen(this.project);



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
                        project.name,
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
                            'Created on: ${project.createdAt}',
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
                            'Users: ${project.members.map((user) => '${user.firstName} ${user.lastName}').join(", ")}',
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
   
  'BAcklog   :  ',
  textAlign: TextAlign.start,
  style: TextStyle(
      color: Colors.grey[800],
      fontWeight: FontWeight.bold,
      fontSize: 20 ), 
     ),
           
           /* child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                /* ListView.builder(
                    itemCount: project.sprints.length,
                    itemBuilder: (BuildContext context, int index) {
                      Sprint sprint = project.sprints[index];
                      return ListTile(
                        title: Text(sprint.nom),
                        subtitle: Text(
                            'Start: ${sprint.datedebut} - End: ${sprint.datefin}'),
                        // Add more details as needed
                      );
                    },
                  ),*/
                 /* Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    project.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                    
                  Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: BacklogButton(
                      onPressed: () {
                        // do something when button is pressed
                      },
                    ),
                  )
                ],
              ),
             
                
            ),
            
       
*/

*/


 Text(
   
  'les sprints   :  ',
  textAlign: TextAlign.start,
  style: TextStyle(
      color: Colors.grey[800],
      fontWeight: FontWeight.bold,
      fontSize: 20 ), 
     ),
        
               Expanded(
            child: ListView.builder(
        itemCount: project.sprints.length,
        itemBuilder: (context, index) {
          final sprint = project.sprints[index];
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
   
  'les tasks   :  ',
  textAlign: TextAlign.start,
  style: TextStyle(
      color: Colors.grey[800],
      fontWeight: FontWeight.bold,
      fontSize: 20 ), 
     ),
                Expanded(
            child: ListView.builder(
        itemCount: project.tasks.length,
        itemBuilder: (context, index) {
          final task = project.tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            onTap: () {
            
            },
          );
        },
      ),
                ),
        ],
      ),
    );
  }
}
