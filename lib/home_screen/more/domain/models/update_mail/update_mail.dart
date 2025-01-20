import 'data.dart';

class UpdateMailModel {
  bool? success;
  Data? data;
  String? message;

  UpdateMailModel({this.success, this.data, this.message});

  factory UpdateMailModel.fromJson(Map<String, dynamic> json) =>
      UpdateMailModel(
        success: json['success'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };
}
