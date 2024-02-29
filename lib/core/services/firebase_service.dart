import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<void> signUp(
      {required String email, required String password, required String firstName, required String lastName,}) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password,);
    await credential.user?.updateDisplayName([firstName,lastName].join(" "));
  }

  Future<void> signIn({required String email, required String password,}) async {
   await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}