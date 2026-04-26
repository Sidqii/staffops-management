extension RolePermission on String? {
  bool get canCreateTask {
    return this == 'admin' || this == 'owner' || this == 'pm';
  }
}
