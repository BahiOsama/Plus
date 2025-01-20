import 'data.dart';

class CheckCode {
	bool? success;
	Data? data;
	String? message;

	CheckCode({this.success, this.data, this.message});

	factory CheckCode.fromJson(Map<String, dynamic> json) => CheckCode(
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
