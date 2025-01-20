import 'data.dart';

class Vertification {
	bool? success;
	Data? data;
	String? token;
	String? message;

	Vertification({this.success, this.data, this.token, this.message});

	factory Vertification.fromJson(Map<String, dynamic> json) => Vertification(
				success: json['success'] as bool?,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
				token: json['token'] as String?,
				message: json['message'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'success': success,
				'data': data?.toJson(),
				'token': token,
				'message': message,
			};
}
