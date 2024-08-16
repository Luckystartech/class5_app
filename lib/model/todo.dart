class Todo {
  Todo({
    required this.taskName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
    this.isCompleted = false,
  });

  final String taskName;
  final String date;
  final String startTime;
  final String endTime;
  final String description;
  bool? isCompleted;

  Map<String, dynamic> toMap() {
    return {
      'taskName': taskName,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory  Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      taskName: map['taskName'],
      date: map['date'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      description: map['description'],
      isCompleted: map['isCompleted'],
    );
  }
}
