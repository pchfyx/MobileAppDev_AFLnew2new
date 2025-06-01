import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/task_view_model.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: ListView.builder(
        itemCount: viewModel.tasks.length,
        itemBuilder: (context, index) {
          final task = viewModel.tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                  decoration: task.isCompleted ? TextDecoration.lineThrough : null),
            ),
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (_) => viewModel.toggleTask(task.id),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => viewModel.deleteTask(task.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => AddTaskScreen())),
        child: Icon(Icons.add),
      ),
    );
  }
}
