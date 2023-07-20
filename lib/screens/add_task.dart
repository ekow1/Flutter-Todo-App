import 'package:flutter/material.dart';
import 'package:my_schedule/model/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return Container(
      color: const Color(0xff757575),
      child: Container(
        height: MediaQuery.of(context).viewInsets.bottom +
            300.0, // Set the desired height
        padding: const EdgeInsets.all(40.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Add Schedule',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: Colors.teal,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                  ),
                ),
                controller: textEditingController,
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    // Check if the input is not empty
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(value);
                    Navigator.pop(context);
                  }
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              Consumer<TaskData>(builder: (context, taskData, _) {
                return ElevatedButton(
                  onPressed: () {
                    final inputValue = textEditingController.text.trim();
                    if (inputValue.isNotEmpty) {
                      // Check if the input is not empty
                      taskData.addTask(inputValue);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 13.0,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.task_outlined),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Submit Task',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
