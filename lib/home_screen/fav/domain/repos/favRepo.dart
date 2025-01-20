import 'package:dartz/dartz.dart';
import 'package:first_project/helper/faileur.dart';
import 'package:first_project/home_screen/fav/domain/model/get_fav_model/get_fav_model.dart';

abstract class FavRepo {
  Future<Either<Faileur, FavModel>> getFav();
  Future<Either<Faileur, void>> addFav({required var id});
}
