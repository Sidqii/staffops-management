enum TimelineStatus { done, current, upcoming }

class TimelineItem {
  final String title;
  final String? date;
  final String emptyText;
  final String? prefix;
  final TimelineStatus status;
  final bool isTask;

  TimelineItem({
    required this.title,
    required this.date,
    required this.emptyText,
    this.prefix,
    required this.status,
    this.isTask = true,
  });
}
