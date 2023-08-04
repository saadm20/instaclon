class TextFieldErrorTextException implements Exception {
  final String? message;
  TextFieldErrorTextException([this.message]);

  @override
  toString() {
    Object? message = this.message;
    if (message == null) return "Exception";
    return "$message";
  }
}
