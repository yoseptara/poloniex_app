import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_session_cubit.g.dart';
part 'auth_session_state.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  expired
}

class AuthSessionCubit extends HydratedCubit<AuthSessionState> {


  AuthSessionCubit()
      : super(
          AuthSessionState(),
        );

  void updateState({AuthStatus? status,}) {
    emit(state.update(status: status));
  }


  @override
  AuthSessionState? fromJson(Map<String, dynamic> json) =>
      AuthSessionState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(AuthSessionState state) => state.toJson();
}