part of 'auth_session_cubit.dart';

@JsonSerializable()
class AuthSessionState {
  final AuthStatus status;


  AuthSessionState({
    this.status = AuthStatus.unauthenticated,
  });

    // factory AuthSessionState.initial() {
  //   return AuthSessionState(
  //   );
  // }

  factory AuthSessionState.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionStateFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSessionStateToJson(this);


  @override
  String toString() {
    return 'AuthSessionState{status: $status}';
  }

  AuthSessionState update({
    AuthStatus? status,

  }) {
    return AuthSessionState(
      status  : status ?? this.status,

    );
  }
}