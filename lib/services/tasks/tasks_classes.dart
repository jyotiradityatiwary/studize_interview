import 'package:flutter/material.dart';

class Task {
  final int id;
  String title;
  String description;
  DateTime timeStart;
  DateTime timeEnd;
  Color color;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.timeStart,
    required this.timeEnd,
    required this.color,
  }) : isCompleted = false;
}

class Subject {
  String name;
  String iconAssetPath;
  Color color;
  int numTasksLeft;

  Subject({required this.name, required this.color})
      : iconAssetPath = 'assets/icons/physics.png',
        numTasksLeft = 0;
}
