class DataStoreModel {
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

  DataStoreModel({
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

  factory DataStoreModel.fromJson(Map<String, dynamic> json) => DataStoreModel(
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'category_id': categoryId,
        'name': name,
        'code': code,
        'code_value': codeValue,
        'image': image,
        'location_title': locationTitle,
        'lng': lng,
        'lat': lat,
        'is_liked': isLiked,
        'link': link,
      };
}
