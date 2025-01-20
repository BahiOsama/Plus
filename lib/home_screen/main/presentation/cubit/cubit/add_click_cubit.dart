import 'package:bloc/bloc.dart';
import 'package:first_project/home_screen/main/domain/repos/mainScreenRepo.dart';
import 'package:meta/meta.dart';

part 'add_click_state.dart';

class AddClickCubit extends Cubit<AddClickState> {
  AddClickCubit(this.mainScreenRepo) : super(AddClickInitial());
  final MainScreenRepo mainScreenRepo;
  void addClick({required var storeId, required var categoryid}) async {
    emit(AddClickLoading());
    final result =
        await mainScreenRepo.addClick(categoryid: categoryid, storeId: storeId);
    result.fold(
      (faileur) {
        emit(AddClickFaileur(err: faileur.toString()));
      },
      (success) {
        emit(AddClickSuccess());
      },
    );
  }
}
