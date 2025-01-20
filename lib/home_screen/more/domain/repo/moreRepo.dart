import 'package:dartz/dartz.dart';
import 'package:first_project/helper/faileur.dart';
import 'package:first_project/home_screen/more/domain/models/add_sugetsation_model.dart';
import 'package:first_project/home_screen/more/domain/models/log_out.dart';
import 'package:first_project/home_screen/more/domain/models/profile_details/profile_details.dart';
import 'package:first_project/home_screen/more/domain/models/update_mail/update_mail.dart';

abstract class MoreRepo {
  Future<Either<Faileur, AddSugetsationModel>> addSugestations(
      {required String text});
  Future<Either<Faileur, ProfileDetails>> profileDetails();
  Future<Either<Faileur, LogOutModel>> logOut();
  Future<Either<Faileur, UpdateMailModel>> updateMail(
      {required String email, required int testMode});
  Future<Either<Faileur, void>> verfiEmail(
      {required String newEmail, required var code});
}
