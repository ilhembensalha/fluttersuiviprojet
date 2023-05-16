import 'package:flutter/material.dart';
import 'package:suiviprojet/BacklogButton.dart';
import 'package:suiviprojet/models/Project.dart';
import 'package:suiviprojet/models/Tache.dart';

import 'models/Sprint.dart';
class SprintDetailsScreen extends StatelessWidget {
  final Sprint sprint;

  SprintDetailsScreen(this.sprint);

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Column(
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
                        sprint.nom,
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
                            'Created on: ${sprint.datedebut}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                   
                    ],
                  ),
                ),
              ],
            ),
          ),
         

            Expanded(
            child: ListView.builder(
        itemCount: sprint.tasks.length,
        itemBuilder: (context, index) {
          final task = sprint.tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
          );
        },
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



          ),
          
        ],
      ),
    );
     
  }
}