import 'package:hooks_riverpod/hooks_riverpod.dart';

class CorrectUserNameNotifier extends StateNotifier<String> {
  CorrectUserNameNotifier() : super('');

  String val(String value) {
    if (value.contains(' ')) {
      state = 'Spaces are not allowed';
      return state;
    }

    // Check for characters like $ and #
    if (value.contains(RegExp(r'[$#]'))) {
      state = 'Characters like \$ and # are not allowed';
      return state;
    }

    // Check for minimum 6 characters
    if (value.length < 6) {
      state = 'value must have at least 6 characters';
      return state;
    }

    // Check for only alphabets, numbers, and underscores
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      state = 'Only alphabets, numbers, and underscores are allowed';
      return state;
    }

    // Return null if there are no errors
    state = "";
    return state;
  }
}
