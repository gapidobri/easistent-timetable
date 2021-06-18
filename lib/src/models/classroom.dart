class Classroom {
  final String name;
  final int id;

  Classroom(this.name, this.id);

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
    json['title'] ?? '',
    int.parse(json['attributes']['value']),
  );

  Map<String, dynamic> toJson() => ({
    'name': name,
    'id': id,
  });
}