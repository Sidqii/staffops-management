class UserResponse {
  final int id;
  final String name;

  UserResponse({required this.id, required this.name});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
