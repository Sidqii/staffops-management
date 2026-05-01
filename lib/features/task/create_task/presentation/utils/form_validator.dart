import 'package:mini_project_e2e_app/features/task/detail_task/data/model/actor/actor_model.dart';
import 'package:mini_project_e2e_app/features/task/detail_task/data/model/task/priority_model.dart';

class FormValidator {
  static String? validateTitle(String value) {
    if (value.trim().isEmpty) return 'Title is required';
    if (value.trim().length < 3) return 'Minimum 3 characters';
    return null;
  }

  static String? validateUser(ActorModel? user) {
    if (user == null) return 'Assignee must be selected';
    return null;
  }

  static String? validatePriority(PriorityModel? prio) {
    if (prio == null) return 'Priority must be selected';
    return null;
  }

  static String? validateDate(DateTime? date) {
    if (date == null) return 'Due date is required';
    return null;
  }
}
