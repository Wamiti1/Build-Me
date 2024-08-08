import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String profilePicture;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  // Method to convert JSON to User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profilePicture: json['profilePicture'],
    );
  }

  // Method to convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
    };
  }
}
