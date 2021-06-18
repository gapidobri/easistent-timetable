class Class {
  final String name;
  final int id;

  Class(this.name, this.id);

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    json['title'] ?? '',
    int.parse(json['attributes']['value']),
  );

  Map<String, dynamic> toJson() => ({
    'name': name,
    'id': id,
  });
}