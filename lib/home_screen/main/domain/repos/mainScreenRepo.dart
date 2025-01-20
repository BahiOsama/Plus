import 'package:dartz/dartz.dart';
import 'package:first_project/helper/faileur.dart';
import 'package:first_project/home_screen/main/domain/models/get_categories_model/get_categories_model.dart';
import 'package:first_project/home_screen/main/domain/models/store_model/store_model.dart';

abstract class MainScreenRepo {
  Future<Either<Faileur, GetCategoriesModel>> getCategories();
  Future<Either<Faileur, StoreModel>> getStores({required var categoryid});
  Future<Either<Faileur, void>> addClick(
      {required var storeId, required var categoryid});
}
