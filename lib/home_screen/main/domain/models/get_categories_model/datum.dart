import 'sub_category.dart';

class Datum {
	int? id;
	String? title;
	String? photo;
	List<SubCategory>? subCategories;

	Datum({this.id, this.title, this.photo, this.subCategories});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				title: json['title'] as String?,
				photo: json['photo'] as String?,
				subCategories: (json['subCategories'] as List<dynamic>?)
						?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'title': title,
				'photo': photo,
				'subCategories': subCategories?.map((e) => e.toJson()).toList(),
			};
}
