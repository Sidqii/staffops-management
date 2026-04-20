class TaskQueryParams {
  final int page;
  final int? perPage;
  final String? sortBy;
  final String? order;
  final String? title;
  final String? description;
  final String? status;
  final String? priority;
  final String? search;

  TaskQueryParams({
    this.page = 1,
    this.perPage,
    this.sortBy,
    this.order,
    this.title,
    this.description,
    this.status,
    this.priority,
    this.search,
  });

  Map<String, dynamic> toQuery() {
    return {
      'page': page,
      'per_page': perPage,
      'sort_by': sortBy,
      'order': order,
      'title': title,
      'description': description,
      'status': status,
      'priority': priority,
      'search': search,
    }..removeWhere((key, value) => value == null);
  }
}
