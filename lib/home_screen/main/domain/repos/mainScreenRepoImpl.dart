import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:first_project/api/api_services.dart';
import 'package:first_project/helper/faileur.dart';
import 'package:first_project/home_screen/main/domain/models/get_categories_model/get_categories_model.dart';
import 'package:first_project/home_screen/main/domain/models/store_model/store_model.dart';
import 'package:first_project/home_screen/main/domain/repos/mainScreenRepo.dart';

class MainScreenRepoImpl extends MainScreenRepo {
  final ApiServices apiServices;

  MainScreenRepoImpl({required this.apiServices});

  @override
  Future<Either<Faileur, GetCategoriesModel>> getCategories() async {
    try {
      var data = await apiServices.get(
        endPoint: '/api/categories',
      );
      return right(GetCategoriesModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, StoreModel>> getStores(
      {required var categoryid}) async {
    try {
      var data = await apiServices.get(
        endPoint: '/api/stores',
        queryParameters: {
          'category_id': categoryid,
        },
      );
      return right(StoreModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, void>> addClick(
      {required storeId, required categoryid}) async {
    try {
      await apiServices.post(endPoint: '/api/add_click', body: {
        'store_id': storeId,
        'category_id': categoryid,
      });
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }
}
