import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineData extends StatelessWidget {
  final String title;
  final String? date;
  final bool isFirst;
  final bool isLast;
  final bool isDone;

  const TimelineData({
    super.key,
    required this.title,
    required this.date,
    required this.isFirst,
    required this.isLast,
    required this.isDone,
  });

  static const titleText = TextStyle(fontWeight: FontWeight.bold);
  static const descsText = TextStyle(fontSize: 12, color: Colors.grey);
  static const subtitleText = TextStyle(fontSize: 11, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,

      // decorate line
      beforeLineStyle: LineStyle(
        color: isDone ? Colors.green : Colors.grey,
        thickness: 1,
      ),

      // decorate icon
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: isDone ? Colors.green : Colors.grey,
        iconStyle: isDone
            ? IconStyle(iconData: Icons.check, color: Colors.white)
            : null,
      ),

      // decorate content
      endChild: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        decoration: BoxDecoration(
          color: AppColor.softWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleText),

            Text('Add some descritpion on timeline', style: descsText),

            const SizedBox(height: 8),

            Text(date ?? '', style: subtitleText),
          ],
        ),
      ),
    );
  }
}
