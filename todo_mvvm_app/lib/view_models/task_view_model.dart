import 'package:flutter/material.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();

  List<Task> get tasks => _repository.getTasks();

  void addTask(String title) {
    final task = Task(id: DateTime.now().toString(), title: title);
    _repository.addTask(task);
    notifyListeners();
  }

  void toggleTask(String id) {
    _repository.toggleTask(id);
    notifyListeners();
  }

  void deleteTask(String id) {
    _repository.deleteTask(id);
    notifyListeners();
  }
}
