import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instaclon/state/auth/backend/authentication.dart';
import 'package:instaclon/state/auth/exceptions/textFieldException.dart';
import 'package:instaclon/state/models/auth_results.dart';
import 'package:instaclon/state/models/auth_state.dart';

class AuthStateListener extends StateNotifier<AuthState> {
  final _authenticator = const Authentication();

  AuthStateListener() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
          isLoading: false,
          result: AuthResults.signedIn,
          userId: _authenticator.userId);
    }
  }

  Future<void> signOut() async {
    state = state.copyWithIsLoading(true);
    await _authenticator.signOut();
    state = const AuthState.unknown();
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    if (email == "" || password == "" || name == "") {
      throw TextFieldErrorTextException("Please fill all fields");
    } else {
      state = state.copyWithIsLoading(true);

      final result = await _authenticator.signUp(
        email: email,
        password: password,
        name: name,
      );
      final userId = _authenticator.userId;
      state = AuthState(
          isLoading: false,
          // ignore: unnecessary_type_check
          result: result is AuthResults
              ? AuthResults.signedIn
              : AuthResults.failure,
          userId: userId);

      print(
          ' signUp in authstateListener called. result is - ${state.result} ');
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    if (email != "" || password != "") {
      final result = await _authenticator.signIn(
        email: email,
        password: password,
      );
      state = state.copyWithIsLoading(true);
      final userId = _authenticator.userId;

      state = AuthState(
          isLoading: false,
          // ignore: unnecessary_type_check
          result: result is AuthResults
              ? AuthResults.signedIn
              : AuthResults.failure,
          userId: userId);
      print(
          ' signIn in authstateListener called. result is - ${state.result} ');
    } else {
      throw TextFieldErrorTextException("Please fill all fields");
    }
  }
}
