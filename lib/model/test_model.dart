class TestModel {
  String? name;
  String? id;

  TestModel({this.name, this.id});

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      name: json['name'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }

  TestModel copyWith({
    String? name,
    String? id,
  }) {
    return TestModel(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
