import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instaclon/state/auth/listeners/auth_state_listener.dart';
import 'package:instaclon/state/models/auth_state.dart';

final authStateProvider =
    StateNotifierProvider<AuthStateListener, AuthState>((ref) {
  print('authStateProvider is called . AUthStateListener is returned');
  return AuthStateListener();
});
