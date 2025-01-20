import 'package:bloc/bloc.dart';
import 'package:first_project/home_screen/fav/domain/model/get_fav_model/get_fav_model.dart';
import 'package:first_project/home_screen/fav/domain/repos/favRepo.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.favRepo) : super(GetFavInitial());
  final FavRepo favRepo;
  void getFav() async {
    emit(GetFavLoading());
    final result = await favRepo.getFav();
    result.fold(
      (faileur) {
        emit(GetFavFaileur(err: faileur.err.toString()));
      },
      (success) {
        emit(GetFavSuccess(favModel: success));
      },
    );
  }

  void addFav(final int id) async {
    emit(AddCubitLoading());
    final result = await favRepo.addFav(id: id);
    result.fold(
      (faileur) {
        emit(AddCubitFaileur(err: faileur.err.toString()));
      },
      (success) {
        emit(AddCubitSuccess());
      },
    );
  }
}
