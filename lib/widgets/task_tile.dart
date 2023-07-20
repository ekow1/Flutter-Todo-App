import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) onCheck;
  final Function() onEdit; // New edit button callback

  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.isChecked,
    required this.onCheck,
    required this.onEdit, // Add the onEdit callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          decorationColor: isChecked ? Colors.red : null,
          color: isChecked ? Colors.black.withOpacity(0.2) : Colors.black,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: IconButton(
              icon: const Icon(Icons.edit_note_rounded),
              color: Colors.teal,
              onPressed: onEdit,
            ),
          ),
          Checkbox(
            activeColor: Colors.teal,
            value: isChecked,
            focusColor: Colors.teal,
            onChanged: onCheck,
          ),
        ],
      ),
    );
  }
}
