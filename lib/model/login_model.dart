import 'common_model.dart';
import 'config_model.dart';

class LoginModel {
  final ConfigModel config;
  final GridNavModel grid;
  final List<CommonModel> commons;

  LoginModel({this.config, this.grid, this.commons});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    var localCommon = json['commons'] as List;
    List<CommonModel> comModels =
        localCommon.map((i) => CommonModel.fromJson(i));
    return LoginModel(
        commons: comModels,
        config: ConfigModel.fromJson(json['config']),
        grid: GridNavModel.fromJson(json['grid']));
  }
}
