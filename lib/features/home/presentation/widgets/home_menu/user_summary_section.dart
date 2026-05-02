import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class UserSummarySection extends StatelessWidget {
  final String name;
  final int current;
  final int total;

  const UserSummarySection({
    super.key,
    required this.name,
    required this.current,
    required this.total,
  });

  static const TextStyle titleText = TextStyle(
    color: AppColor.grey900,
    fontSize: 45,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle subtitleText = TextStyle(
    color: AppColor.grey900,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(name, style: titleText),

        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Showing '),
              TextSpan(text: current.toString(), style: subtitleText),
              const TextSpan(text: ' of '),
              TextSpan(text: total.toString(), style: subtitleText),
              const TextSpan(text: ' tasks.'),
            ],
          ),
        ),
      ],
    );
  }
}
