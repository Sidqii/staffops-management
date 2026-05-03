import 'package:flutter/widgets.dart';
import 'package:staffops/shared/themes/app_color.dart';

class TotalTaskCompleted extends StatelessWidget {
  final int totalCompleted;

  const TotalTaskCompleted({super.key, required this.totalCompleted});

  static const title = TextStyle(
    color: AppColor.greenPalm,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const subtitle = TextStyle(color: AppColor.greenPalm, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.grey900,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(totalCompleted.toString(), style: title),
          Text('Task Completed', style: subtitle),
        ],
      ),
    );
  }
}
