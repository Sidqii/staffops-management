import 'package:dio/dio.dart';
import 'package:staffops/shared/exception/server_exception.dart';

abstract class DeleteTaskDatasource {
  Future<void> deleteTask(int id);
}

class DeleteTaskDatasourceImpl implements DeleteTaskDatasource {
  final Dio dio;

  DeleteTaskDatasourceImpl(this.dio);

  @override
  Future<void> deleteTask(int id) async {
    try {
     await dio.delete('/tasks/$id');
    } on ServerException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
