import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class OpsLogo extends StatelessWidget {
  const OpsLogo({super.key});

  final opsStyle = const TextStyle(
    fontSize: 16,
    color: AppColor.softWhite,
    fontWeight: FontWeight.bold,
  );

  final coStyle = const TextStyle(color: AppColor.softWhite);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 20,

      child: _contentContainer(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('OPS', style: opsStyle),
            Text('.co', style: coStyle),
          ],
        ),
      ),
    );
  }

  Widget _contentContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.grey900,
        borderRadius: BorderRadius.circular(10),
      ),

      child: child,
    );
  }
}
