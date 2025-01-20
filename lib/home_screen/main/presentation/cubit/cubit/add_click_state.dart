part of 'add_click_cubit.dart';

@immutable
sealed class AddClickState {}

final class AddClickInitial extends AddClickState {}

final class AddClickLoading extends AddClickState {}

final class AddClickSuccess extends AddClickState {}

final class AddClickFaileur extends AddClickState {
  final String err;

  AddClickFaileur({required this.err});
}
