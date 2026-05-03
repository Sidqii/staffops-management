import 'package:staffops/features/home/data/models/request/filter_query_params.dart';
import 'package:staffops/features/home/domain/entities/paginated_view.dart';
import 'package:staffops/shared/entities/user/user.dart';

abstract class HomeRepository {
  Future<User?> getCredential();

  Future<PaginatedView> fetchTaskList(FilterQueryParams params);
}