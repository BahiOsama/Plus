part of 'fav_cubit.dart';

@immutable
sealed class FavState {}

final class GetFavInitial extends FavState {}

final class GetFavLoading extends FavState {}

final class GetFavSuccess extends FavState {
  final FavModel favModel;

  GetFavSuccess({required this.favModel});
}

final class GetFavFaileur extends FavState {
  final String err;

  GetFavFaileur({required this.err});
}

final class AddCubitInitial extends FavState {}

final class AddCubitLoading extends FavState {}

final class AddCubitFaileur extends FavState {
  final String err;

  AddCubitFaileur({required this.err});
}

final class AddCubitSuccess extends FavState {}
