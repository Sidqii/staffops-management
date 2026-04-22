import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class UserSummarySection extends StatelessWidget {
  final String name;
  final String current;
  final String total;

  const UserSummarySection({
    super.key,
    required this.name,
    required this.current,
    required this.total,
  });

  static const TextStyle titleText = TextStyle(
    color: AppColor.grey900,
    fontSize: 45,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitleText = TextStyle(
    color: AppColor.grey900,
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(name, style: titleText),

        Text('Loaded $current out of $total task.', style: subtitleText),
      ],
    );
  }
}
