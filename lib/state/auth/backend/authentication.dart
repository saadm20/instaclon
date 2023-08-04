import 'package:firebase_auth/firebase_auth.dart';
import 'package:instaclon/state/auth/constants/constants.dart';
import 'package:instaclon/state/auth/exceptions/custom_exception.dart';

import 'package:instaclon/state/models/auth_results.dart';
import 'package:instaclon/state/posts/typedef/user_id.dart';

class Authentication {
  const Authentication();

  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  String? get userEmail => FirebaseAuth.instance.currentUser?.email;
  String? get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  bool get isAlreadyLoggedIn => userId != null;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<AuthResults> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException("Week Password");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException("Email Already in Use");
      } else if (e.code == 'network-request-failed') {
        throw CustomException("No Internet Connection");
      } else if (e.code == 'invalid-email') {
        throw CustomException("Invalid Email");
      } else {
        throw CustomException("Something went Wrong");
      }
    }
    print(
        'AuthResults.signedIn - sigup authentication called - sign up complete');
    return AuthResults.signedIn;
  }

  Future<AuthResults> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthConstants.userNotFound) {
        throw CustomException("User not Found");
      } else if (e.code == AuthConstants.wrongPassword) {
        throw CustomException("Wrong Password");
      } else if (e.code == AuthConstants.invalidEmail) {
        throw CustomException("Invalid Email");
      } else if (e.code == AuthConstants.networkRequestFailed) {
        throw CustomException("No Internet Connection");
      } else {
        throw CustomException("Generic Auth Exception");
      }
    }
    print(
        'AuthResults.signedIn - sig authentication called - sign up complete');
    return AuthResults.signedIn;
  }
}
