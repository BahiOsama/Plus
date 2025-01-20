import 'datum.dart';

class GetCategoriesModel {
	bool? success;
	List<Datum>? data;
	String? message;

	GetCategoriesModel({this.success, this.data, this.message});

	factory GetCategoriesModel.fromJson(Map<String, dynamic> json) {
		return GetCategoriesModel(
			success: json['success'] as bool?,
			data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
			message: json['message'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'data': data?.map((e) => e.toJson()).toList(),
				'message': message,
			};
}
