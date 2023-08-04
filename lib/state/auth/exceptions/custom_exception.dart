class CustomException implements Exception {
  final String? message;
  CustomException([this.message]);

  @override
  toString() {
    Object? message = this.message;
    if (message == null) return "Exception";
    return "$message";
  }
}
