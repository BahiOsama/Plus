import 'package:dartz/dartz.dart';
import 'package:first_project/auth/domain/model/auth_model/check_code/check_code.dart';
import 'package:first_project/auth/domain/model/auth_model/forgot_password/forgot_password.dart';
import 'package:first_project/auth/domain/model/auth_model/loginAndregesteation/auth_model.dart';
import 'package:first_project/auth/domain/model/auth_model/vertification/vertification/vertification.dart';
import 'package:first_project/helper/faileur.dart';

abstract class Authrepo {
  Future<Either<Faileur, AuthModel>> register(
      {required String name,
      required String email,
      required String password,
      required String rePassword});

  Future<Either<Faileur, AuthModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Faileur, ForgotPassword>> forgotMyPassword({
    required String email,
  });
  Future<Either<Faileur, CheckCode>> checkCode({
    required String email,
    required String code,
  });

  Future<Either<Faileur, Vertification>> vertification({
    required String email,
    required String code,
  });
}
