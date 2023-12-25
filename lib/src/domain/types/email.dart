class Email {
  final String email;
  final String password;

  Email({required this.email, required this.password});

  @override
  String toString() {
    return "Email(email: '$email')";
  }
}
