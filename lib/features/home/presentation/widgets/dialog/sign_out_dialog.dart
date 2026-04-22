import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class SignOutDialog extends StatelessWidget {
  final String name;
  final Future<void> Function() onConfirm;

  const SignOutDialog({super.key, required this.name, required this.onConfirm});

  static const titleTxtStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const btnNotYet = TextStyle(color: AppColor.grey900);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.height * 0.23,
        height: MediaQuery.of(context).size.height * 0.16,

        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),

        decoration: BoxDecoration(
          color: AppColor.softWhite,
          borderRadius: BorderRadius.circular(30),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Wait, Stay!', style: titleTxtStyle),

            Text('Are you leaving me all alone, $name? 😭'),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 5,

              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('Not yet', style: btnNotYet),
                ),

                SizedBox(
                  height: 40,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.error,
                      foregroundColor: AppColor.softWhite,
                    ),

                    onPressed: () async {
                      Get.back();
                      await onConfirm();
                    },

                    child: const Text('Yes sure!'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
