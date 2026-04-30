import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/priority_response.dart';
import 'package:mini_project_e2e_app/features/task/create_task/data/model/response/user_response.dart';

class FormValidator {
  static String? validateTitle(String value) {
    if (value.trim().isEmpty) return 'Title is required';
    if (value.trim().length < 3) return 'Minimum 3 characters';
    return null;
  }

  static String? validateUser(UserResponse? user) {
    if (user == null) return 'Assignee must be selected';
    return null;
  }

  static String? validatePriority(PriorityResponse? prio) {
    if (prio == null) return 'Priority must be selected';
    return null;
  }

  static String? validateDate(DateTime? date) {
    if (date == null) return 'Due date is required';
    return null;
  }
}
