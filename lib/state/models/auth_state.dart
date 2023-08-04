import 'package:instaclon/state/models/auth_results.dart';
import 'package:instaclon/state/posts/typedef/user_id.dart';

class AuthState {
  final bool isLoading;
  final UserId? userId;
  final AuthResults? result;

  const AuthState({
    required this.isLoading,
    required this.result,
    required this.userId,
  });

  const AuthState.unknown()
      : result = null,
        userId = null,
        isLoading = false;
  AuthState copyWithIsLoading(bool isLoading) =>
      AuthState(isLoading: isLoading, result: result, userId: userId);

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (isLoading == isLoading && result == result && userId == userId);
}
