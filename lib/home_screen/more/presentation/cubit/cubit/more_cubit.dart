import 'package:bloc/bloc.dart';
import 'package:first_project/helper/local_data/shared_pref.dart';
import 'package:first_project/home_screen/more/domain/models/add_sugetsation_model.dart';
import 'package:first_project/home_screen/more/domain/models/log_out.dart';
import 'package:first_project/home_screen/more/domain/models/profile_details/profile_details.dart';
import 'package:first_project/home_screen/more/domain/models/update_mail/update_mail.dart';
import 'package:first_project/home_screen/more/domain/repo/moreRepo.dart';
import 'package:meta/meta.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreCubitState> {
  MoreCubit(this.moreRepo) : super(MoreCubitInitial());
  final MoreRepo moreRepo;

  void addsugest({required var text}) async {
    emit(AddSuggestationLoading());
    final result = await moreRepo.addSugestations(text: text);
    result.fold(
      (faileur) {
        emit(AddSuggestationFaileur(msg: faileur.toString()));
      },
      (success) {
        emit(AddSuggestationsuccess(addSugetsationModel: success));
      },
    );
  }

  void profileDetails() async {
    emit(ProfileDetailsLoading());
    final result = await moreRepo.profileDetails();
    result.fold(
      (faileur) {
        emit(ProfileDetailsFaileur(err: faileur.toString()));
      },
      (success) {
        emit(ProfileDetailsSuccess(profileDetails: success));
      },
    );
  }

  Future<void> logOut() async {
    emit(LogOutLoading());
    final result = await moreRepo.logOut();
    result.fold(
      (faileur) {
        emit(LogOutFaileur(err: faileur.toString()));
      },
      (success) {
        CashedSharedPrefrances.deleteData(key: 'token');
        emit(LogOutSuccess(logOutModel: success));
      },
    );
  }

  void updateMaail({required String email, required int testMode}) async {
    emit(UpdateMailLoading());
    final result = await moreRepo.updateMail(email: email, testMode: testMode);
    result.fold(
      (faileur) {
        emit(UpdateMailFaileur(err: faileur.toString()));
      },
      (success) {
        emit(UpdateMailSuccess(updateMailModel: success));
      },
    );
  }

  void verfiMaail({required String newEmail, required var code}) async {
    emit(VerfiMailLoading());
    final result = await moreRepo.verfiEmail(newEmail: newEmail, code: code);
    result.fold(
      (faileur) {
        emit(VerfiMailFaileur(err: faileur.toString()));
      },
      (success) {
        emit(VerfiMailSuccess());
      },
    );
  }
}
