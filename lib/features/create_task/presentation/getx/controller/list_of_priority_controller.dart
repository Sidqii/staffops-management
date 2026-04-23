import 'dart:math';

import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/priority_list.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/some_funny_hints/priority_hints.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/get_references_of_priority.dart';

class ListOfPriorityController extends GetxController {
  final GetReferencesOfPriority usecase;

  ListOfPriorityController(this.usecase);

  RxList<PriorityList> priority = <PriorityList>[].obs;

  RxBool isLoading = false.obs;

  final priorHint = PriorityHints.values;

  late final String hintText;

  @override
  void onInit() {
    super.onInit();

    loadMore();

    hintText = priorHint[Random().nextInt(priorHint.length)];
  }

  Future<void> loadMore() async {
    try {
      isLoading(true);

      final result = await usecase.execute();

      priority.value = result;
    } catch (e) {
      // TODO: nanti dihapus ini yak
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
