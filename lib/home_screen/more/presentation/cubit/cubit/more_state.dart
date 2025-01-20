part of 'more_cubit.dart';

@immutable
sealed class MoreCubitState {}

final class MoreCubitInitial extends MoreCubitState {}

final class AddSuggestationLoading extends MoreCubitState {}

final class AddSuggestationsuccess extends MoreCubitState {
  final AddSugetsationModel addSugetsationModel;

  AddSuggestationsuccess({required this.addSugetsationModel});
}

final class AddSuggestationFaileur extends MoreCubitState {
  final String msg;

  AddSuggestationFaileur({required this.msg});
}

final class ProfileDetailsSuccess extends MoreCubitState {
  final ProfileDetails profileDetails;

  ProfileDetailsSuccess({required this.profileDetails});
}

final class ProfileDetailsFaileur extends MoreCubitState {
  final String err;

  ProfileDetailsFaileur({required this.err});
}

final class ProfileDetailsLoading extends MoreCubitState {}

final class LogOutLoading extends MoreCubitState {}

final class LogOutSuccess extends MoreCubitState {
  final LogOutModel logOutModel;

  LogOutSuccess({required this.logOutModel});
}

final class LogOutFaileur extends MoreCubitState {
  final String err;

  LogOutFaileur({required this.err});
}

final class UpdateMailLoading extends MoreCubitState {}

final class UpdateMailSuccess extends MoreCubitState {
  final UpdateMailModel updateMailModel;

  UpdateMailSuccess({required this.updateMailModel});
}

final class UpdateMailFaileur extends MoreCubitState {
  final String err;

  UpdateMailFaileur({required this.err});
}

final class VerfiMailLoading extends MoreCubitState {}

final class VerfiMailFaileur extends MoreCubitState {
  final String err;

  VerfiMailFaileur({required this.err});
}

final class VerfiMailSuccess extends MoreCubitState {}
