class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  void editTask(String newName) {
    name = newName;
  }
}
