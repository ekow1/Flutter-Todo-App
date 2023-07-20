import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_schedule/model/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deletTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void editTask(Task task, String newTaskTitle) {
    task.editTask(newTaskTitle);
    notifyListeners();
  }
}
