import 'package:flutter/material.dart';

class Review {
  final String id;
  final String userId;
  final String category;
  final String content;


  Review({
    required this.id,
    required this.userId,
    required this.category,
    required this.content,

  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      userId: json['userId'],
      category: json['engineerId'],
      content: json['content'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'engineerId': category,
      'content': content,
    
    };
  }
}
