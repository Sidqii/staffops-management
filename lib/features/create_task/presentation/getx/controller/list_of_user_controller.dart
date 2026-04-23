import 'package:get/get.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/entities/user_list.dart';
import 'package:mini_project_e2e_app/features/create_task/domain/usecase/get_references_of_user.dart';

class ListOfUserController extends GetxController {
  final GetReferencesOfUser usecase;

  ListOfUserController(this.usecase);

  RxList<UserList> users = <UserList>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    fetchListOfuser();
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
