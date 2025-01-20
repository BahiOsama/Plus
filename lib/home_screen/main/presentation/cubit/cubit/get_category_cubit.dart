import 'package:bloc/bloc.dart';
import 'package:first_project/home_screen/main/domain/models/get_categories_model/get_categories_model.dart';
import 'package:first_project/home_screen/main/domain/repos/mainScreenRepo.dart';
import 'package:meta/meta.dart';

part 'get_category_state.dart';

class GetCategoriiesCubit extends Cubit<GetCategoryState> {
  final MainScreenRepo mainScreenRepo;
  GetCategoriiesCubit(this.mainScreenRepo) : super(MainScreenInitial());
  void getCategories() async {
    emit(GetCategoriesLoading());
    final result = await mainScreenRepo.getCategories();
    result.fold(
      (faileur) {
        emit(GetCategoriesFaileur(err: faileur.toString()));
      },
      (success) {
        emit(GetCategoriesSuccess(getCategoriesModel: success));
      },
    );
  }
}
