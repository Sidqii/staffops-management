import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/domain/entities/some_timeline/timeline_item.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/getx/controller/task_detail_controller.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/presentation/utils/timeline_set_up_widget.dart';
import 'package:mini_project_e2e_app/shared/themes/app_color.dart';

class TaskDetailTimeline extends GetView<TaskDetailController> {
  const TaskDetailTimeline({super.key});

  static const titleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    final started = controller.taskDetail.value?.timeline?.startedAt;
    final process = controller.taskDetail.value?.timeline?.completedAt;
    final completed = controller.taskDetail.value?.deadline;

    final timelines = [
      TimelineItem(
        title: 'Started at',
        date: started,
        emptyText: 'This task hasn’t started yet',
        status: started != null ? TimelineStatus.done : TimelineStatus.current,
        isTask: true,
      ),
      TimelineItem(
        title: 'Progressing',
        date: process,
        emptyText: 'Task is not in progress yet',
        status: process != null
            ? TimelineStatus.done
            : (started != null
                  ? TimelineStatus.current
                  : TimelineStatus.upcoming),
        isTask: true,
      ),
      TimelineItem(
        title: 'Must complete on',
        date: completed,
        emptyText: 'This task hasn’t been completed yet',
        prefix: 'Due date',
        status: completed != null
            ? TimelineStatus.upcoming
            : TimelineStatus.upcoming,
        isTask: false,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text('Timeline project', style: titleStyle),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: AppColor.blueWhale,
            borderRadius: BorderRadius.circular(15),
          ),
          child: _buildTimelineSection(timelines),
        ),
      ],
    );
  }

  Widget _buildTimelineSection(List<TimelineItem> items) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(items.length, (index) {
        final item = items[index];

        final formattedDate = item.date != null
            ? formatDate(item.date.toString())
            : item.emptyText;

        return TimelineSetUpWidget(
          title: item.title,
          date: formattedDate,

          isFirst: index == 0,
          isLast: index == items.length - 1,

          status: item.status,
          isTask: item.isTask,
        );
      }),
    );
  }

  String formatDate(String? value) {
    if (value == null || value.isEmpty) {
      return '...';
    }

    try {
      final dateTime = DateTime.parse(value).toLocal();

      return DateFormat('dd MMM yyyy').format(dateTime);
    } catch (e) {
      return '...';
    }
  }
}
