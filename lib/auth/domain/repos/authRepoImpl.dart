import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:first_project/api/api_services.dart';
import 'package:first_project/auth/domain/model/auth_model/check_code/check_code.dart';
import 'package:first_project/auth/domain/model/auth_model/forgot_password/forgot_password.dart';
import 'package:first_project/auth/domain/model/auth_model/loginAndregesteation/auth_model.dart';
import 'package:first_project/auth/domain/model/auth_model/vertification/vertification/vertification.dart';
import 'package:first_project/auth/domain/repos/authrepo.dart';
import 'package:first_project/helper/faileur.dart';
import 'package:first_project/helper/local_data/shared_pref.dart';

class AuthRepoImpl extends Authrepo {
  final ApiServices apiServices;

  AuthRepoImpl({required this.apiServices});

  @override
  Future<Either<Faileur, AuthModel>> register(
      {required String name,
      required String email,
      required String password,
      required String rePassword}) async {
    try {
      var data = await apiServices.post(
        endPoint: '/api/register',
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': rePassword,
          'device_token': 'mmmmmmmm'
        },
      );
      return right(AuthModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, AuthModel>> login(
      {required String email, required String password}) async {
    try {
      var data = await apiServices.post(
        endPoint: '/api/login',
        body: {
          'email': email,
          'password': password,
          'device_token': 'mmmmmm',
        },
      );
      await CashedSharedPrefrances.insertToCash(
        key: 'token',
        value: data['token'],
      );
      return right(AuthModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, ForgotPassword>> forgotMyPassword(
      {required String email}) async {
    try {
      var data = await apiServices.post(
        endPoint: '/api/password/forget',
        body: {
          'email': email,
        },
      );
      return right(ForgotPassword.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, CheckCode>> checkCode(
      {required String email, required String code}) async {
    try {
      var data = await apiServices.post(
        endPoint: '/api/password/code',
        body: {
          'email': email,
          'code': code,
        },
      );
      return right(CheckCode.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }

  @override
  Future<Either<Faileur, Vertification>> vertification(
      {required String email, required String code}) async {
    try {
      var data = await apiServices.post(
        endPoint: '/api/verification/verify',
        body: {
          'email': email,
          'code': code,
        },
      );
      return right(Vertification.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFaileur.fromDioError(e));
      }
      return left(ServerFaileur(err: e.toString()));
    }
  }
}
