import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class ConfigHeaderActionBtn extends StatelessWidget {
  final VoidCallback onPressed;

  const ConfigHeaderActionBtn({super.key, required this.onPressed});

  static const title = TextStyle(fontSize: 50, fontWeight: FontWeight.bold);

  static const subtitle = TextStyle(letterSpacing: 5);

  static const padding = EdgeInsets.fromLTRB(35, 120, 35, 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text('URL', style: title),
              Text('Configuration', style: subtitle),
            ],
          ),

          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.25,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.grey900,
                foregroundColor: AppColor.blueWhale,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
              ),

              onPressed: onPressed,
              child: const Text('Back'),
            ),
          ),
        ],
      ),
    );
  }
}
