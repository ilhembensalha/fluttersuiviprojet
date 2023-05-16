class Membre {
  int id;
  String firstName;
  String lastName;
  String image;
  String email;

  Membre({
     this.id,
     this.firstName,
     this.lastName,
     this.image,
     this.email,
  });

  factory Membre.fromJson(Map<String, dynamic> json) {
    return Membre(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'image': image,
      'email': email,
    };
  }
}
