class CommonModel {
  final String name;
  final String age;

  CommonModel({this.name, this.age});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(name: json['name'], age: json['age']);
  }
}
