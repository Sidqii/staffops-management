import 'dart:math';

import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/tasks/domain/entities/priority_list.dart';
import 'package:mini_project_e2e_app/features/tasks/domain/entities/some_funny_hints/priority_hints.dart';
import 'package:mini_project_e2e_app/features/tasks/domain/usecase/get_references_of_priority.dart';

class ListOfPriorityController extends GetxController {
  final GetReferencesOfPriority usecase;

  ListOfPriorityController(this.usecase);

  RxList<PriorityList> priorities = <PriorityList>[].obs;
  RxBool isLoading = false.obs;

  final priorHint = PriorityHints.values;

  late final String hintText;

  @override
  void onInit() {
    super.onInit();

    fetchListOfPriority();

    hintText = priorHint[Random().nextInt(priorHint.length)];
  }

  Future<void> fetchListOfPriority() async {
    isLoading(true);

    try {
      final result = await usecase.execute();

      priorities.value = result;
    } finally {
      isLoading(false);
    }
  }
}
