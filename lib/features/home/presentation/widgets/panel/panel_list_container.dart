import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class PanelListContainer extends StatelessWidget {
  final Widget child;
  final double height;

  const PanelListContainer({
    super.key,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: const BoxDecoration(
        color: AppColor.softWhite,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
      ),
      child: child,
    );
  }
}
