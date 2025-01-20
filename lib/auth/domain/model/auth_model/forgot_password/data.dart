class Data {
	int? resetCode;

	Data({this.resetCode});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				resetCode: json['reset_code'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'reset_code': resetCode,
			};
}
