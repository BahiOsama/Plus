class Data {
	int? code;

	Data({this.code});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				code: json['code'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'code': code,
			};
}
