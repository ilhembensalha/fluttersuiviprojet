import 'package:suiviprojet/models/Membre.dart';

class Tache {
  int id;
  Membre membre;
  String title;
  String description;

  Tache({
    this.id,
    this.membre,
     this.title,
     this.description,
  });

  factory Tache.fromJson(Map<String, dynamic> json) {
    Membre membre;
    if (json['membre'] != null) {
      membre = Membre.fromJson(json['membre']);
    }

    return Tache(
      id: json['id'],
      membre: membre,
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'membre': membre != null ? membre.toJson() : null,
      'title': title,
      'description': description,
    };
  }
}
