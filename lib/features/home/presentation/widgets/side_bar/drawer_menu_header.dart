import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class DrawerMenuHeader extends StatelessWidget {
  final String? name;
  final String? role;
  final String? mail;

  const DrawerMenuHeader({
    super.key,
    required this.name,
    required this.role,
    required this.mail,
  });

  static const TextStyle avatarTxtStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleTxtStyle = TextStyle(
    color: AppColor.softWhite,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subTitleTxtStyle = TextStyle(
    color: AppColor.softWhite,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle emailTxtStyle = TextStyle(
    color: AppColor.softWhite,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Text(name?[0].toUpperCase() ?? 'G', style: avatarTxtStyle),
        ),

        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(name ?? ' Guest', style: titleTxtStyle),

            Text(' | ${role ?? 'user'}', style: subTitleTxtStyle),
          ],
        ),

        const SizedBox(height: 4),

        Text(mail ?? 'guest@mail.com', style: emailTxtStyle),
      ],
    );
  }
}
