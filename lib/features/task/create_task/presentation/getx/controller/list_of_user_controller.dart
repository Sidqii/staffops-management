import 'dart:math';

import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/entities/assigned_to_hints.dart';
import 'package:mini_project_e2e_app/features/task/create_task/domain/usecase/get_references_of_user.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/model/actor/actor_model.dart';

class ListOfUserController extends GetxController {
  final GetReferencesOfUser usecase;

  ListOfUserController(this.usecase);

  RxList<ActorModel> users = <ActorModel>[].obs;
  RxBool isLoading = false.obs;

  final assignHint = AssignedToHints.values;

  late final String hintText;

  @override
  void onInit() {
    super.onInit();

    fetchListOfuser();
    hintText = assignHint[Random().nextInt(assignHint.length)];
  }

  Future<void> fetchListOfuser() async {
    isLoading(false);

    try {
      final result = await usecase.execute();

      users.value = result;
    } finally {
      isLoading(false);
    }
  }
}
