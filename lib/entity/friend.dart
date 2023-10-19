class Friend {
  int? id;
  String? name;

  Friend({
    id,
    name
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}