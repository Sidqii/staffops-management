import 'package:mini_project_e2e_app/features/home/domain/entities/dashboard.dart';

class PaginatedView {
  final List<Dashboard> taskList;
  final int currentPage;
  final int lastPage;
  final int total;

  PaginatedView({
    required this.taskList,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });
}
