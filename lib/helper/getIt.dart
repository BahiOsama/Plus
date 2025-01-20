import 'package:dio/dio.dart';
import 'package:first_project/api/api_services.dart';
import 'package:first_project/auth/domain/repos/authRepoImpl.dart';
import 'package:first_project/home_screen/fav/domain/repos/favRepoImp.dart';
import 'package:first_project/home_screen/main/domain/repos/mainScreenRepoImpl.dart';
import 'package:first_project/home_screen/more/domain/repo/moreRepoImpl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItSetUp() async {
  getIt.registerSingleton<ApiServices>(ApiServices(dio: Dio()));
//
//
//
//

  getIt.registerSingleton<MainScreenRepoImpl>(
      MainScreenRepoImpl(apiServices: getIt.get<ApiServices>()));

  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(apiServices: getIt.get<ApiServices>()));

  getIt.registerSingleton<FavRepoimpl>(
      FavRepoimpl(apiServices: getIt.get<ApiServices>()));

  getIt.registerSingleton<MoreRepoImpl>(
      MoreRepoImpl(apiServices: getIt.get<ApiServices>()));
}
