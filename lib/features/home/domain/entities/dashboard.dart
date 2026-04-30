class Dashboard {
  final int id;
  final String title;
  final String? description;
  final String status;
  final String priority;
  final String assignee;
  final String creator;
  final String deadline;
  final String? started;
  final String? completed;

  Dashboard({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.assignee,
    required this.creator,
    required this.deadline,
    required this.started,
    required this.completed,
  });
}
