import 'package:mini_project_e2e_app/features/home/data/models/request/filter_query_params.dart';
import 'package:mini_project_e2e_app/features/home/data/repositories/home_repository.dart';
import 'package:mini_project_e2e_app/features/home/domain/entities/paginated_view.dart';

class DashboardUsecase {
  final HomeRepository repository;

  DashboardUsecase(this.repository);

  Future<PaginatedView> execute(FilterQueryParams params) async {
    return await repository.fetchTaskList(params);
  }
}
