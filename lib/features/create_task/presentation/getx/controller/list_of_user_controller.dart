import 'dart:math';

import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/some_funny_hints/assigned_to_hints.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/user_list.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/get_references_of_user.dart';

class ListOfUserController extends GetxController {
  final GetReferencesOfUser usecase;

  ListOfUserController(this.usecase);

  RxList<UserList> users = <UserList>[].obs;
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
