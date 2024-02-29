import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poloniex_app/core/blocs/auth-session/auth_session_cubit.dart';
import 'package:poloniex_app/core/repositories/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepo;
  final AuthSessionCubit authSessionCubit;

  RegisterCubit({
    required this.authRepo,
    required this.authSessionCubit,
  }) : super(
          RegisterState(),
        );

  Future<void> register() async {
    try {
      emit(state.update(showProgressLoader: true));
      await authRepo.signUp(
          firstName: state.firstName,
          lastName: state.lastName,
          email: state.email,
          password: state.password);
      emit(
        state.update(
          dismissProgressLoader: true,
          returnToLoginPage: true,
        ),
      );
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

  void updateState({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    emit(
      state.update(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
  }
}
