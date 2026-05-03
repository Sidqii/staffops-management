import 'package:staffops/features/home/data/models/response/dashboard_model.dart';
import 'package:staffops/features/home/domain/entities/paginated_view.dart';

class DashboardPaginate {
  final List<DashboardModel> taskList;
  final int currentPage;
  final int lastPage;
  final int total;

  DashboardPaginate({
    required this.taskList,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  factory DashboardPaginate.fromJson(Map<String, dynamic> json) {
    return DashboardPaginate(
      taskList: (json['data'] as List)
          .map((e) => DashboardModel.fromJson(e))
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
