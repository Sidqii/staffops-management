class PriorityResponse {
  final int id;
  final String name;

  PriorityResponse({required this.id, required this.name});

  factory PriorityResponse.fromJson(Map<String, dynamic> json) {
    return PriorityResponse(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
