class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(searchUrl: json['searchUrl']);
  }
}

class GridNavModel {
  final String title;
  final ConfigModel config;

  GridNavModel({this.title, this.config});

  factory GridNavModel.fromJson(Map<String, dynamic> json) {
    return GridNavModel(
        title: json['title'], config: ConfigModel.fromJson(json['config']));
  }
}
