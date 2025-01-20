import 'datum.dart';

class StoreModel {
  bool? success;
  List<DataStoreModel>? data;
  String? message;

  StoreModel({this.success, this.data, this.message});

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DataStoreModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
