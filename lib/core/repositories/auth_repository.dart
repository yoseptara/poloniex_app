import 'package:poloniex_app/core/services/firebase_service.dart';

class AuthRepository {
  final FirebaseService firebaseService;

  const AuthRepository(this.firebaseService);

  Future<void> signUp(
      {required String email, required String password, required String firstName, required String lastName,}) async {
   await firebaseService.signUp(email: email, password: password, firstName: firstName, lastName: lastName);
  }

  Future<void> signIn({required String email, required String password,}) async {
    await firebaseService.signIn(email: email, password: password);
  }

  Future<void> signOut() async {
    await firebaseService.signOut();
  }
}