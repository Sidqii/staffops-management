import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staffops/features/task/create_task/presentation/utils/file_item.dart';
import 'package:staffops/features/task/update_task/data/model/update_task_body.dart';
import 'package:staffops/features/task/update_task/domain/usecase/prio_list_usecase.dart';
import 'package:staffops/features/task/update_task/domain/usecase/task_update_usecase.dart';
import 'package:staffops/features/task/update_task/domain/usecase/user_list_usecase.dart';
import 'package:staffops/shared/entities/task/attachment.dart';
import 'package:staffops/shared/entities/task/priority.dart';
import 'package:staffops/shared/entities/task/task.dart';
import 'package:staffops/shared/entities/user/user.dart';

class UpdateTaskController extends GetxController {
  final TaskUpdateUsecase usecase;
  final PrioListUsecase prioList;
  final UserListUsecase userList;

  UpdateTaskController(this.usecase, this.prioList, this.userList);
  // task
  Rxn<Task> task = Rxn<Task>();

  // updated state
  final titleController = TextEditingController();
  final descsController = TextEditingController();

  Rxn<User> selectedUser = Rxn<User>();
  Rxn<Priority> selectedPrio = Rxn<Priority>();
  Rxn<DateTime> selectedDate = Rxn<DateTime>();

  RxList<Attachment> fileSelected = RxList<Attachment>(); // existing file
  RxList<PlatformFile> selectedFile = RxList<PlatformFile>(); // local file

  RxList<Priority> prior = RxList<Priority>();
  RxList<User> users = RxList<User>();

  RxList<String> deletedId = RxList<String>();

  // getter files
  List<FileItem> get fileItems => [
    ...fileSelected.map((element) {
      return FileItem(name: element.fileName, id: element.id.toString());
    }),

    ...selectedFile.map((element) {
      return FileItem(name: element.name, file: element);
    }),
  ];

  // flag
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    _previewTask(Get.arguments);

    _loadOptions();
  }

  void _previewTask(Task data) {
    task.value = data;

    titleController.text = data.title;
    descsController.text = data.description ?? '';

    selectedPrio.value = data.priority;
    selectedUser.value = data.assignee;

    selectedDate.value = data.deadline;
    fileSelected.assignAll(data.attachment ?? []);
  }

  void _loadOptions() async {
    users.value = await userList.execute();
    prior.value = await prioList.execute();
  }

  Future<void> onSubmit(int id) async {
    isLoading(true);

    try {
      final requestBody = UpdateTaskBody(
        title: titleController.text,
        description: descsController.text,
        assignee: selectedUser.value!.id,
        priority: selectedPrio.value!.id,
        deadline: selectedDate.value,
        files: selectedFile,
        deleteId: deletedId,
      );

      // print('file deleted: ${requestBody.deleteId}');

      await usecase.execute(requestBody, id);

      Get.back(result: true);
    } catch (e) {
      // print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> pickFiles() async {
    final result = await FilePicker.pickFiles(allowMultiple: true);

    if (result != null) {
      final currentFile = result.files;

      for (final file in currentFile) {
        final isExist = selectedFile.any((e) => e.name == file.name);

        if (!isExist) {
          selectedFile.add(file);
        }
      }
    }
  }

  Future<void> removeFile(FileItem file) async {
    if (file.id != null) {
      deletedId.add(file.id!);

      fileSelected.removeWhere((e) => e.id.toString() == file.id);
    } else {
      selectedFile.remove(file.file);
    }
  }

  @override
  void onClose() {
    super.onClose();

    titleController.dispose();
    descsController.dispose();
  }
}
