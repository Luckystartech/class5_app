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
}
