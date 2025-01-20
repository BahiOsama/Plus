import 'package:bloc/bloc.dart';
import 'package:first_project/home_screen/main/domain/models/store_model/store_model.dart';
import 'package:first_project/home_screen/main/domain/repos/mainScreenRepo.dart';
import 'package:meta/meta.dart';

part 'get_store_state.dart';

class GetStoreCubit extends Cubit<GetStoreState> {
  GetStoreCubit(this.mainScreenRepo) : super(GetStoreInitial());
  final MainScreenRepo mainScreenRepo;

  void getStores({required var categoryId}) async {
    emit(GetStoresLoading());
    final result = await mainScreenRepo.getStores(categoryid: categoryId);
    result.fold(
      (faileur) {
        emit(GetStoresFaileur(err: faileur.toString()));
      },
      (success) {
        emit(GetStoresSuccess(storeModel: success));
      },
    );
  }
}
