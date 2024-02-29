part of 'login_cubit.dart';

class LoginState {
  final String email;
  final String password;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final String? errMsg;

  LoginState({
    this.email = '',
    this.password = '',
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.errMsg,
  });

  // factory LoginState.initial() {
  //   return LoginState(
  //   );
  // }

  LoginState update({
    String? email,
    String? password,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    String? errMsg,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
      errMsg: errMsg,
    );
  }
}
