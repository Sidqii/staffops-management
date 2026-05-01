import 'package:mini_project_e2e_app/features/home/data/models/request/filter_query_params.dart';
import 'package:mini_project_e2e_app/features/home/domain/entities/paginated_view.dart';
import 'package:mini_project_e2e_app/shared/entities/user/user.dart';

abstract class HomeRepository {
  Future<User?> getCredential();

  Future<PaginatedView> fetchTaskList(FilterQueryParams params);
}