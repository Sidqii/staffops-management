import 'package:staffops/shared/entities/task/task.dart';

abstract class DetailTaskRepository {
  Future<Task> fetchTaskDetail(int id);
}
