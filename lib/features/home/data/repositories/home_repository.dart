import 'package:mini_project_e2e_app/features/auth/domain/entities/user.dart';
import 'package:mini_project_e2e_app/features/home/data/models/request/filter_query_params.dart';
import 'package:mini_project_e2e_app/features/home/domain/entities/paginated_view.dart';

abstract class HomeRepository {
  Future<User?> getCredential();

  Future<PaginatedView> fetchTaskList(FilterQueryParams params);
}