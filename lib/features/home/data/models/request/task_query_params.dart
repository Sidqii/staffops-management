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

  TaskQueryParams copyWith({
    int? page,
    int? perPage,
    String? sortBy,
    String? order,
    String? title,
    String? description,
    String? status,
    String? priority,
    String? search,
  }) {
    return TaskQueryParams(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      sortBy: sortBy ?? this.sortBy,
      order: order ?? this.order,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      search: search ?? this.search,
    );
  }

  // TaskQueryParams copyWith({
  //   int? page,
  //   int? perPage,
  //   String? sortBy,
  //   String? order,
  //   Nullable<String>? title,
  //   Nullable<String>? description,
  //   Nullable<String>? status,
  //   Nullable<String>? priority,
  //   Nullable<String>? search,
  // }) {
  //   return TaskQueryParams(
  //     page: page ?? this.page,
  //     perPage: perPage ?? this.perPage,
  //     sortBy: sortBy ?? this.sortBy,
  //     order: order ?? this.order,
  //     title: title != null ? title.value : this.title,
  //     description: description != null ? description.value : this.description,
  //     status: status != null ? status.value : this.status,
  //     priority: priority != null ? priority.value : this.priority,
  //     search: search != null ? search.value : this.search,
  //   );
  // }

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

class Nullable<T> {
  final T? value;

  const Nullable(this.value);
} // TODO: helper untuk nilai nullable di copWith
