import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poloniex_app/core/blocs/auth-session/auth_session_cubit.dart';
import 'package:poloniex_app/core/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepo;
  final AuthSessionCubit authSessionCubit;

  LoginCubit({
    required this.authRepo,
    required this.authSessionCubit,
  }) : super(
          LoginState(),
        );

  Future<void> login() async {
    try {
      emit(state.update(showProgressLoader: true));
      await authRepo.signIn(email: state.email, password: state.password);
      emit(state.update(dismissProgressLoader: true));
      authSessionCubit.updateState(status: AuthStatus.authenticated);
    } on FirebaseAuthException catch (e) {
      emit(
        state.update(
          dismissProgressLoader: true,
          errMsg: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.update(
          dismissProgressLoader: true,
          errMsg: 'Unexpected error',
        ),
      );
      rethrow;
    }
  }

  void updateState({String? email, String? password}) {
    emit(state.update(email: email, password: password));
  }
}
