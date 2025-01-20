class LogOutModel {
  bool? success;
  String? message;

  LogOutModel({this.success, this.message});

  factory LogOutModel.fromJson(Map<String, dynamic> json) => LogOutModel(
        success: json['success'] as bool?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
