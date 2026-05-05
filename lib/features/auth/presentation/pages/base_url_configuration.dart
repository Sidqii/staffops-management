import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:staffops/config/network/api_config.dart';
import 'package:staffops/features/auth/presentation/getx/controller/base_url_controller.dart';
import 'package:staffops/features/auth/presentation/widgets/url_config/base_url_input_widget.dart';
import 'package:staffops/features/auth/presentation/widgets/url_config/config_header_action_btn.dart';
import 'package:staffops/features/auth/presentation/widgets/url_config/submit_url_button.dart';
import 'package:staffops/shared/themes/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseUrlConfiguration extends GetView<BaseUrlController> {
  const BaseUrlConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.blueWhale,

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ConfigHeaderActionBtn(
              onPressed: () {
                Get.back();
              },
            ),

            Expanded(
              child: Container(
                width: double.infinity,

                margin: EdgeInsets.only(top: 150),
                padding: const EdgeInsets.all(50),

                decoration: BoxDecoration(
                  color: AppColor.softWhite,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                ),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,

                    children: [
                      const Text('Input URL'),

                      BaseUrlInputWidget(
                        controller: controller.textInputController,
                      ),

                      SubmitUrlButton(
                        onPressed: () async {
                          if (!controller.validate()) {
                            if (!Get.isSnackbarOpen) {
                              Get.snackbar(
                                'Error',
                                'Oops! That URL doesn’t look right',
                              );
                            }
                            return;
                          }

                          try {
                            final url = controller.normalizeUrl(controller.url);

                            ApiConfig.setUrl(url);

                            Get.back(result: true);
                          } catch (e) {
                            print('Error submit: $e');
                          }
                        },
                      ),

                      _licenseTextWrapper(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _licenseTextWrapper() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LICENSE',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),

        const SizedBox(height: 6),

        Text(
          'This application is licensed under the MIT License.\n\n'
          'Permission is hereby granted, free of charge, to any person obtaining a copy '
          'of this software to deal in the Software without restriction.\n\n'
          'The source code for this project is publicly available at:',
          style: TextStyle(color: AppColor.grey600),
        ),

        const SizedBox(height: 2),

        GestureDetector(
          behavior: HitTestBehavior.opaque,

          // copy path
          onLongPress: () async {
            const url = 'https://github.com/Sidqii/staffops-management';

            await Clipboard.setData(const ClipboardData(text: url));

            Get.snackbar(
              'Copied',
              'Link copied to clipboard',
              snackPosition: SnackPosition.TOP,
            );
          },

          // go to link
          onTap: () async {
            final uri = Uri.parse(
              'https://github.com/Sidqii/staffops-management',
            );

            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            } else {
              Get.snackbar('Failed', 'Could not open the link');
            }
          },

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'https://github.com/Sidqii/staffops-management',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.',
          style: TextStyle(color: AppColor.grey600),
        ),
      ],
    );
  }
}
