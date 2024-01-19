import 'package:flutter/material.dart';
import 'package:studize_interview/services/tasks/tasks_classes.dart';
import 'package:studize_interview/services/tasks/tasks_exceptions.dart';

class TasksService {
  static Future<List<String>> getSubjectNameList() async {
    return ['Physics', 'Chemistry', 'Mathematics'];
  }

  static Future<List<Subject>> getSubjectList() async {
    return <Subject>[
      Subject(name: 'Physics', color: Colors.red),
      Subject(name: 'Chemistry', color: Colors.blue),
      Subject(name: 'Mathematics', color: Colors.green),
    ];
  }

  static Future<List<Task>> getAllTasks() async {
    final DateTime now = DateTime.now();
    List<Task> taskList = <Task>[
      Task(
        id: 0,
        title: 'Mathematics',
        description: 'Complex Numbers Quiz',
        timeStart: now.add(const Duration(hours: 1)),
        timeEnd: now.add(const Duration(hours: 2)),
        color: Colors.red,
      ),
      Task(
        id: 1,
        title: 'Physics',
        description: 'Projectile Motion Revision',
        timeStart: now.add(const Duration(hours: 6)),
        timeEnd: now.add(const Duration(hours: 8)),
        color: Colors.blue,
      ),
      Task(
        id: 2,
        title: 'Chemistry',
        description: 'Isomerism - Prepare Notes',
        timeStart: now.add(const Duration(hours: 16)),
        timeEnd: now.add(const Duration(hours: 18)),
        color: Colors.green,
      ),
    ];
    return taskList;
  }

  /// Returns task object that corresponds to the specified [taskId] inside the
  /// specified [subjectName].
  ///
  /// Throws exception `TaskNotFoundException` if specified `taskId` is not found
  /// and `SubjectNotFoundException` if specified `subjectName` is not found.
  static Future<Task> getTask({required int taskId}) async {
    List<Task> taskList = await getAllTasks();
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].id == taskId) {
        return taskList[i];
      }
    }

    // If the loop completes without finding the specified id, then throw
    // exception
    throw TaskNotFoundException();
  }
}
