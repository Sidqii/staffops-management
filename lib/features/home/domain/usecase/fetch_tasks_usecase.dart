import 'package:mini_project_e2e_app/features/home/data/models/request/task_query_params.dart';
import 'package:mini_project_e2e_app/features/home/data/repositories/home_repository.dart';
import 'package:mini_project_e2e_app/features/home/domain/entities/paginated_view.dart';

class FetchTasksUsecase {
  final HomeRepository repository;

  FetchTasksUsecase(this.repository);

  Future<PaginatedView> execute(TaskQueryParams params) async {
    return await repository.fetchTaskList(params);
  }
}
