class Validator {
  static String? emailValidation({String? value, required String errorText}) {
    return value != null &&
            RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                .hasMatch(value)
        ? null
        : errorText;
  }

  static String? passwordValidation(
      {String? value, required String errorText}) {
    return value != null &&
            RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{8,}$').hasMatch(value)
        ? null
        : errorText;
  }
}
