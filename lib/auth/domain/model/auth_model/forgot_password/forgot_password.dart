import 'data.dart';

class ForgotPassword {
	bool? success;
	Data? data;
	String? message;

	ForgotPassword({this.success, this.data, this.message});

	factory ForgotPassword.fromJson(Map<String, dynamic> json) {
		return ForgotPassword(
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
