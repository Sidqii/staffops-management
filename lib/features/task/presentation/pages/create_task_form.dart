import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:mini_project_e2e_app/features/home/presentation/getx/controller/fetch_credential_controller.dart';
import 'package:mini_project_e2e_app/features/task/presentation/getx/controller/create_task_controller.dart';
import 'package:mini_project_e2e_app/features/task/presentation/widgets/form/custom_dropdown_field.dart';
import 'package:mini_project_e2e_app/features/task/presentation/widgets/form/input_desc_text_field.dart';
import 'package:mini_project_e2e_app/features/task/presentation/widgets/form/input_title_text_field.dart';

class CreateTaskForm extends GetView<CreateTaskController> {
  const CreateTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final userController = Get.find<FetchCredentialController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              _headerContent(),

              _contentWrapper([
                Text('Title'),
                InputTitleTextField(hintText: controller.hintText),
              ]),

              _contentWrapper([
                Text('Description'),
                InputDescTextField(descText: controller.descText),
              ]),

              _contentWrapper([
                Text('Assigned to'),
                Obx(() {
                  return CustomDropdownField(
                    value: controller.selectedUserId.value,
                    items: controller.users.map((e) => e['id'] as int).toList(),
                    labelBuilder: (id) {
                      final user = controller.users.firstWhere((element) {
                        return element['id'] == id;
                      });

                      return user['name'] as String;
                    },
                    hintText: 'Assigned to ...',
                    onChanged: (value) {
                      controller.selectedUserId.value = value;
                    },
                  );
                }),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentWrapper(List<Widget> child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: child,
    );
  }

  Widget _headerContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: [
          Icon(Icons.assignment_outlined),

          Text(
            'Define your task',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          Spacer(),

          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () => Get.back(),

            icon: Icon(Icons.close_rounded),
          ),
        ],
      ),
    );
  }
}
