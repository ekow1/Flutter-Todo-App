import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_schedule/model/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, _) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (BuildContext context, int index) {
            final task = taskData.tasks[index];
            return Dismissible(
              key: Key(task.name),
              onDismissed: (direction) {
                taskData.deletTask(task);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              direction: DismissDirection.endToStart,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return TaskTile(
                    taskTitle: task.name,
                    isChecked: task.isDone,
                    onCheck: (bool? checkboxState) {
                      taskData.updateTask(task);
                    },
                    onEdit: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          String newTaskTitle = task.name;
                          return AlertDialog(
                            title: const Text(
                              'Edit Task',
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                            ),
                            content: TextField(
                              autofocus: true,
                              autocorrect: true,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.teal, width: 2.0),
                                ),
                              ),
                              onChanged: (value) {
                                newTaskTitle = value;
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  taskData.editTask(task, newTaskTitle);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
