import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/task_list.dart';
import 'add_task.dart';
import '../model/task_data.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const AddTaskScreen(),
          );
        },
        backgroundColor: Colors.teal,
        child: const Icon(
          Icons.add,
          size: 30.0,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.schedule),
                        iconSize: 40.0,
                        color: Colors.white,
                      ),
                      const Text(
                        "SCHEDULES ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    height: 35.0,
                    width: 180.0,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.task,
                          size: 20.0,
                        ),
                        Consumer<TaskData>(
                          builder: (context, taskData, _) {
                            final totalTasksCount = taskData.tasks.length;
                            return Text(
                              '$totalTasksCount Total Tasks',
                              style: TextStyle(
                                color: Colors.teal.shade500,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    height: 35.0,
                    width: 180.0,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.task,
                          size: 20.0,
                        ),
                        Consumer<TaskData>(
                          builder: (context, taskData, _) {
                            final incompleteTasksCount = taskData.tasks
                                .where((task) => !task.isDone)
                                .length;
                            return Text(
                              '$incompleteTasksCount Incomplete Tasks',
                              style: TextStyle(
                                color: Colors.teal.shade500,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    height: 35.0,
                    width: 180.0,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.task,
                          size: 20.0,
                        ),
                        Consumer<TaskData>(
                          builder: (context, taskData, _) {
                            final completedTasksCount = taskData.tasks
                                .where((task) => task.isDone)
                                .length;
                            return Text(
                              '$completedTasksCount Completed Tasks',
                              style: TextStyle(
                                color: Colors.teal.shade500,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 30.0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 40.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Consumer<TaskData>(
                  builder: (context, taskData, _) {
                    return taskData.taskCount == 0
                        ? Center(
                            child: Text(
                              'No tasks available.',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.teal.shade500,
                              ),
                            ),
                          )
                        : const TaskList();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
