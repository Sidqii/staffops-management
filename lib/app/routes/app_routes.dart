part of 'app_pages.dart';

abstract class _Paths {
  _Paths._();
  static const AUTH = '/auth';
  static const HOME = '/home';
  static const TASK_VIEW = '/task/view';
  static const TASK_LIST = '/task/list';
  static const TASK_DETAIL = '/task/detail';
  static const CREATE_TASK = '/create/task';
  static const UPDATE_TASK = '/update/task';
}

abstract class AppRoutes {
  AppRoutes._();
  static const AUTH = _Paths.AUTH;
  static const HOME = _Paths.HOME;
  static const TASK_VIEW = _Paths.TASK_VIEW;
  static const TASK_LIST = _Paths.TASK_LIST;
  static const TASK_DETAIL = _Paths.TASK_DETAIL;
  static const CREATE_TASK = _Paths.CREATE_TASK;
  static const UPDATE_TASK = _Paths.UPDATE_TASK;
}
