class SubCategory {
	int? id;
	String? title;
	String? photo;

	SubCategory({this.id, this.title, this.photo});

	factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
				id: json['id'] as int?,
				title: json['title'] as String?,
				photo: json['photo'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'title': title,
				'photo': photo,
			};
}
