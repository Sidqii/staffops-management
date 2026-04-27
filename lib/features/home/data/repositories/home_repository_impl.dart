import 'package:mini_project_e2e_app/config/storage/credential/local_data.dart';
import 'package:mini_project_e2e_app/features/auth/domain/entities/user.dart';
import 'package:mini_project_e2e_app/features/home/data/datasource/home_datasource.dart';
import 'package:mini_project_e2e_app/features/home/data/models/request/filter_query_params.dart';
import 'package:mini_project_e2e_app/features/home/data/repositories/home_repository.dart';
import 'package:mini_project_e2e_app/features/home/domain/entities/paginated_view.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource datasource;
  final LocalData localData;

  HomeRepositoryImpl(this.datasource, this.localData);

  @override
  Future<User?> getCredential() async {
    final result = await localData.getCredential();

    if (result == null) return null;

    return result.toEntity();
  }

  @override
  Future<PaginatedView> fetchTaskList(FilterQueryParams params) async {
    final result = await datasource.getTaskList(params);

    return PaginatedView(
      taskList: result.taskList.map((e) => e.toEntity()).toList(),
      currentPage: result.currentPage,
      lastPage: result.lastPage,
      total: result.total,
    );
  }
}
