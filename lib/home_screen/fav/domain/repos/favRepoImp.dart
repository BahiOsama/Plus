import 'package:dartz/dartz.dart';
import 'package:first_project/api/api_services.dart';
import 'package:first_project/helper/faileur.dart';
import 'package:first_project/helper/local_data/shared_pref.dart';
import 'package:first_project/home_screen/fav/domain/model/get_fav_model/get_fav_model.dart';
import 'package:first_project/home_screen/fav/domain/repos/favRepo.dart';

class FavRepoimpl extends FavRepo {
  final ApiServices apiServices;

  FavRepoimpl({required this.apiServices});
  @override
  Future<Either<Faileur, FavModel>> getFav() async {
    try {
      var data = await apiServices.get(
        headers: {
          'Authorization':
              'Bearer ${CashedSharedPrefrances.getData(key: 'token')}',
        },
        endPoint: '/api/get-favorites',
      );
      return right(FavModel.fromJson(data));
    } on Exception catch (e) {
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, void>> addFav({required id}) async {
    try {
      await apiServices.post(
        body: {
          'store_id': id,
        },
        headers: {
          'Authorization':
              'Bearer ${CashedSharedPrefrances.getData(key: 'token')}',
        },
        endPoint: '/api/favorite',
      );
      return right(null);
    } on Exception catch (e) {
      return left(ServerFaileur(err: e.toString()));
    }
  }
}
