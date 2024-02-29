part of 'register_cubit.dart';

class RegisterState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final bool returnToLoginPage;
  final String? errMsg;


  RegisterState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.returnToLoginPage = false,
    this.errMsg,
  });

    // factory RegisterState.initial() {
  //   return RegisterState(
  //   );
  // }

  RegisterState update({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    bool? returnToLoginPage,
    String? errMsg,

  }) {
    return RegisterState(
      firstName: firstName ?? this.firstName,
      lastName: lastName?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
      returnToLoginPage: returnToLoginPage ?? false,
      errMsg: errMsg,
    );
  }
}