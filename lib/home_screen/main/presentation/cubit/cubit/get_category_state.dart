part of 'get_category_cubit.dart';

@immutable
sealed class GetCategoryState {}

final class MainScreenInitial extends GetCategoryState {}

final class GetCategoriesLoading extends GetCategoryState {}

final class GetCategoriesSuccess extends GetCategoryState {
  final GetCategoriesModel getCategoriesModel;

  GetCategoriesSuccess({required this.getCategoriesModel});
}

final class GetCategoriesFaileur extends GetCategoryState {
  final String err;

  GetCategoriesFaileur({required this.err});
}
