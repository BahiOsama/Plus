import 'datum.dart';

class FavModel {
  bool? success;
  List<Datum>? data;
  String? message;

  FavModel({this.success, this.data, this.message});

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );
}
