import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/home/data/models/request/task_query_params.dart';
import 'package:mini_project_e2e_app/features/home/domain/entities/task_view.dart';
import 'package:mini_project_e2e_app/features/home/domain/usecase/fetch_tasks_usecase.dart';
import 'package:mini_project_e2e_app/shared/exception/server_exception.dart';

class FetchTasksController extends GetxController {
  final FetchTasksUsecase usecase;

  FetchTasksController(this.usecase);

  Rx<TaskQueryParams> query = TaskQueryParams().obs;
  RxList<TaskView> tasks = <TaskView>[].obs;

  RxBool isLoading = false.obs;
  RxBool isLoadMore = false.obs;
  RxBool showMore = false.obs;

  RxInt currentPage = 1.obs;
  RxInt lastPage = 1.obs;
  RxInt total = 0.obs;
  // RxInt totalCompleted = 0.obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      final current = scrollController.position.pixels;
      final maximal = scrollController.position.maxScrollExtent;

      if (current >= maximal - 200) {
        loadMore();
      }
    });

    fetchTasks(query.value);
  }

  Future<void> fetchTasks(TaskQueryParams params) async {
    try {
      isLoading(true);

      final result = await usecase.execute(params);

      tasks.assignAll(result.taskList);

      currentPage.value = result.currentPage;
      lastPage.value = result.lastPage;
      total.value = result.total;
    } on ServerException catch (e) {
      _failedNotification(e.message);
    } catch (e) {
      _errorNotification('Tasks is empty');
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadMore() async {
    if (isLoadMore.value) return;
    if (currentPage.value >= lastPage.value) return;

    try {
      isLoadMore(true);

      final nextPage = currentPage.value + 1;

      query.value = query.value.copyWith(page: nextPage);

      final result = await usecase.execute(query.value);

      tasks.addAll(result.taskList);

      currentPage.value = result.currentPage;

      if (currentPage.value >= lastPage.value) {
        showMore(true);

        // Future.delayed(const Duration(seconds: 2), () {
        //   showMore(false);
        // }); TODO: visible dan invisible showMore.value

        return;
      }
    } on ServerException catch (e) {
      _failedNotification(e.message);
    } catch (e) {
      print('Error di method loadMore');

      _errorNotification('Something wrong on load more');
    } finally {
      isLoadMore(false);
    }
  }

  Future<void> refresh() async {
    isLoading(true);

    try {
      query.value = query.value.copyWith(page: 1);

      final result = await usecase.execute(query.value);

      tasks.assignAll(result.taskList);

      currentPage.value = result.currentPage;
      lastPage.value = result.lastPage;

      _refreshNotification('Everything is up to date!');
    } on ServerException catch (e) {
      _failedNotification(e.message);
    } catch (e) {
      print('Error di method refresh');

      _errorNotification('Something wrong on refresh');
    } finally {
      isLoading(false);
    }
  }

  void _refreshNotification(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar('Refresh', message);
    }
  }

  void _failedNotification(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar('Failed', message);
    }
  }

  void _errorNotification(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar('Error', message);
    }
  }

  int get totalCompleted => tasks.where((task) {
    return task.status == 'completed';
  }).length;
}
