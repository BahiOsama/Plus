import 'package:bloc/bloc.dart';
import 'package:first_project/auth/domain/repos/authrepo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authrepo) : super(AuthInitial());
  final Authrepo authrepo;
  void register({
    required String name,
    required String password,
    required String rePassword,
    required String email,
  }) async {
    emit(AuthRegisterLoading());
    final result = await authrepo.register(
        name: name, email: email, password: password, rePassword: rePassword);
    result.fold(
      (faileur) {
        emit(AuthRegisterFaileur(err: faileur.err.toString()));
      },
      (success) {
        emit(AuthRegisterSuccess());
      },
    );
  }

  void login({
    required String password,
    required String email,
  }) async {
    emit(AuthLogLoading());
    final result = await authrepo.login(
      email: email,
      password: password,
    );

    result.fold(
      (faileur) {
        emit(AuthLogFaileur(err: faileur.err.toString()));
      },
      (success) {
        emit(AuthLoginSuccess());
      },
    );
  }

  void forgetPassword({
    required String email,
  }) async {
    emit(AuthForgetPasswordLoading());
    final result = await authrepo.forgotMyPassword(
      email: email,
    );
    result.fold(
      (faileur) {
        emit(AuthForgetPasswordFaileur(err: faileur.err.toString()));
      },
      (success) {
        emit(AuthForgetPasswordSuccess());
      },
    );
  }

  void forgetPasswordchechCode({
    required String email,
    required String code,
  }) async {
    emit(AuthCheckCodeLoading());
    final result = await authrepo.checkCode(
      code: code,
      email: email,
    );
    result.fold(
      (faileur) {
        emit(AuthCheckCodeFaileur(err: faileur.err.toString()));
      },
      (success) {
        emit(AuthCheckCodeSuccess());
      },
    );
  }

  void vertification({
    required String email,
    required String code,
  }) async {
    emit(AuthVertificationLoading());
    final result = await authrepo.vertification(
      code: code,
      email: email,
    );
    result.fold(
      (faileur) {
        emit(AuthVertificationFaileur(err: faileur.err.toString()));
      },
      (success) {
        emit(AuthVertificationSuccess());
      },
    );
  }
}
