import 'package:flutter/material.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/some_timeline/timeline_item.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineSetUpWidget extends StatelessWidget {
  final String title;
  final String? date;
  final bool isFirst;
  final bool isLast;
  final TimelineStatus status;
  final isTask;

  const TimelineSetUpWidget({
    super.key,
    required this.title,
    required this.date,
    required this.isFirst,
    required this.isLast,
    required this.status,
    required this.isTask,
  });

  static const titleText = TextStyle(fontWeight: FontWeight.bold);
  static const descsText = TextStyle(color: AppColor.grey900);
  static const subtitleText = TextStyle(color: AppColor.grey900);

  @override
  Widget build(BuildContext context) {
    final isDone = status == TimelineStatus.done;
    final isCurrent = status == TimelineStatus.current;

    final done = IconStyle(iconData: Icons.check, color: AppColor.softWhite);

    final wait = IconStyle(
      iconData: isCurrent ? Icons.timelapse_rounded : Icons.circle_outlined,
      color: AppColor.softWhite,
    );

    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,

      // decorate line
      beforeLineStyle: LineStyle(
        color: isDone ? AppColor.success : AppColor.grey600,
        thickness: 1,
      ),

      // decorate icon
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: isDone
            ? AppColor.success
            : isCurrent
            ? AppColor.grey900
            : AppColor.grey600,
        iconStyle: isDone ? done : wait,
      ),

      // decorate content
      endChild: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleText),

            if (isTask) ...[
              const SizedBox(height: 3),

              Text(
                // WIP
                'this will be available in future updates',
                style: descsText,
              ),

              const SizedBox(height: 3),
            ],

            Text(date ?? '', style: subtitleText),
          ],
        ),
      ),
    );
  }
}
