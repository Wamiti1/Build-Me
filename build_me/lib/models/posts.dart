import 'package:flutter/material.dart';

class Post {
  final String id;
  final String engineerId;
  final String title;
  final String content;
  final DateTime date;

  Post({
    required this.id,
    required this.engineerId,
    required this.title,
    required this.content,
    required this.date,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      engineerId: json['engineerId'],
      title: json['title'],
      content: json['content'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'engineerId': engineerId,
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
    };
  }
}
