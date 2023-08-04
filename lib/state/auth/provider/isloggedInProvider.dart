import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instaclon/state/auth/provider/auth_state_provider.dart';
import 'package:instaclon/state/models/auth_results.dart';

Provider isLoggedInProvider = Provider((ref) {
  final authProvider = ref.watch(authStateProvider);
  print(
      'isLoggedIN Provider watched - the value returned is ${authProvider.result}');
  return authProvider.result == AuthResults.signedIn;
});
