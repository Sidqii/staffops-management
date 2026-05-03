import 'package:staffops/shared/entities/user/role.dart';

class User {
  final int id;
  final Role? role;
  final String name;
  final String? email;

  User({
    required this.id,
    this.role,
    required this.name,
    this.email});
}
