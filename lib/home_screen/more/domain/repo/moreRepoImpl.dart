import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:first_project/api/api_services.dart';
import 'package:first_project/helper/faileur.dart';
import 'package:first_project/helper/local_data/shared_pref.dart';
import 'package:first_project/home_screen/more/domain/models/add_sugetsation_model.dart';
import 'package:first_project/home_screen/more/domain/models/log_out.dart';
import 'package:first_project/home_screen/more/domain/models/profile_details/profile_details.dart';
import 'package:first_project/home_screen/more/domain/models/update_mail/update_mail.dart';
import 'package:first_project/home_screen/more/domain/repo/moreRepo.dart';

class MoreRepoImpl extends MoreRepo {
  final ApiServices apiServices;

  MoreRepoImpl({required this.apiServices});

  @override
  Future<Either<Faileur, AddSugetsationModel>> addSugestations(
      {required String text}) async {
    try {
      var data = await apiServices.post(
        headers: {
          'Authorization':
              'Bearer ${CashedSharedPrefrances.getData(key: 'token')}',
        },
        endPoint: '/api/add_suggestion',
        body: {
          'text': text,
        },
      );
      return right(AddSugetsationModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, ProfileDetails>> profileDetails() async {
    try {
      var data = await apiServices.get(
        headers: {
          'Authorization':
              'Bearer ${CashedSharedPrefrances.getData(key: 'token')}',
        },
        endPoint: '/api/profile',
      );
      return right(ProfileDetails.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, LogOutModel>> logOut() async {
    try {
      var data = await apiServices.post(
        endPoint: '/api/logout',
      );
      return right(LogOutModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, UpdateMailModel>> updateMail(
      {required String email, required int testMode}) async {
    try {
      var data = await apiServices.post(
        body: {
          'new': email,
          'test_mode': testMode,
        },
        endPoint: '/api/update/email',
      );
      return right(UpdateMailModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, void>> verfiEmail(
      {required String newEmail, required var code}) async {
    try {
      await apiServices.post(
        body: {
          'new': newEmail,
          'code': code,
        },
        endPoint: '/api/verify/email',
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }
}
