import 'package:flutter/material.dart';

class Contract {
  final String id;
  final String userId;
  final String engineerId;
  final String details;
  final DateTime startDate;
  final DateTime endDate;

  Contract({
    required this.id,
    required this.userId,
    required this.engineerId,
    required this.details,
    required this.startDate,
    required this.endDate,
  });

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'],
      userId: json['userId'],
      engineerId: json['engineerId'],
      details: json['details'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'engineerId': engineerId,
      'details': details,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
