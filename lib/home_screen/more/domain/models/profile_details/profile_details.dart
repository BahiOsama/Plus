import 'data.dart';

class ProfileDetails {
  bool? success;
  Data? data;
  String? message;

  ProfileDetails({this.success, this.data, this.message});

  factory ProfileDetails.fromJson(Map<String, dynamic> json) {
    return ProfileDetails(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };
}
