class Dashboard {
  final int id;
  final String title;
  final String? description;
  final String status;
  final String priority;
  final String assignee;
  final String createdBy;
  final String dueDate;
  final String? startedAt;
  final String? completedAt;

  Dashboard({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.assignee,
    required this.createdBy,
    required this.dueDate,
    required this.startedAt,
    required this.completedAt,
  });
}
