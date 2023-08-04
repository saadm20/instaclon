import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instaclon/state/auth/listeners/correct_username_notfiier.dart';

final correctUserNameProvider =
    StateNotifierProvider<CorrectUserNameNotifier, String>(
        (ref) => CorrectUserNameNotifier());
