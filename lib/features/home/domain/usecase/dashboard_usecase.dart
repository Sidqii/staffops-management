import 'package:staffops/features/home/data/models/request/filter_query_params.dart';
import 'package:staffops/features/home/data/repositories/home_repository.dart';
import 'package:staffops/features/home/domain/entities/paginated_view.dart';

class DashboardUsecase {
  final HomeRepository repository;

  DashboardUsecase(this.repository);

  Future<PaginatedView> execute(FilterQueryParams params) async {
    return await repository.fetchTaskList(params);
  }
}
