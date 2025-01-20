class Datum {
  int? id;
  int? categoryId;
  String? name;
  String? code;
  String? codeValue;
  String? image;
  String? locationTitle;
  String? lng;
  String? lat;
  bool? isLiked;
  String? link;

  Datum({
    this.id,
    this.categoryId,
    this.name,
    this.code,
    this.codeValue,
    this.image,
    this.locationTitle,
    this.lng,
    this.lat,
    this.isLiked,
    this.link,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        categoryId: json['category_id'] as int?,
        name: json['name'] as String?,
        code: json['code'] as String?,
        codeValue: json['code_value'] as String?,
        image: json['image'] as String?,
        locationTitle: json['location_title'] as String?,
        lng: json['lng'] as String?,
        lat: json['lat'] as String?,
        isLiked: json['is_liked'] as bool?,
        link: json['link'] as String?,
      );
}
