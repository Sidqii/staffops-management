import 'package:mini_project_e2e_app/features/home/data/models/response/task_response.dart';
import 'package:mini_project_e2e_app/features/home/domain/entities/paginated_view.dart';

class PaginationResponse {
  final List<TaskResponse> taskList;
  final int currentPage;
  final int lastPage;
  final int total;

  PaginationResponse({
    required this.taskList,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json) {
    return PaginationResponse(
      taskList: (json['data'] as List)
          .map((e) => TaskResponse.fromJson(e))
          .toList(),

      currentPage: json['meta']['current_page'],
      lastPage: json['meta']['last_page'],
      total: json['meta']['total'],
    );
  }

  PaginatedView toEntity() {
    return PaginatedView(
      taskList: taskList.map((e) => e.toEntity()).toList(),
      currentPage: currentPage,
      lastPage: lastPage,
      total: total,
    );
  }
}
