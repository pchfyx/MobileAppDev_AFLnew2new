import '../models/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  List<Task> getTasks() => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
  }

  void toggleTask(String id) {
    final task = _tasks.firstWhere((t) => t.id == id);
    task.isCompleted = !task.isCompleted;
  }

  void deleteTask(String id) {
    _tasks.removeWhere((t) => t.id == id);
  }
}
