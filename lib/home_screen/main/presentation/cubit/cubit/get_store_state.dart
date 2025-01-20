part of 'get_store_cubit.dart';

@immutable
sealed class GetStoreState {}

final class GetStoreInitial extends GetStoreState {}

final class GetStoresLoading extends GetStoreState {}

final class GetStoresSuccess extends GetStoreState {
  final StoreModel storeModel;

  GetStoresSuccess({required this.storeModel});
}

final class GetStoresFaileur extends GetStoreState {
  final String err;

  GetStoresFaileur({required this.err});
}
