class AddSugetsationModel {
	bool? success;
	String? message;

	AddSugetsationModel({this.success, this.message});

	factory AddSugetsationModel.fromJson(Map<String, dynamic> json) {
		return AddSugetsationModel(
			success: json['success'] as bool?,
			message: json['message'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'message': message,
			};
}
