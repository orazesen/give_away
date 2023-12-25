class Name {
  final String firstname;
  final String lastname;
  Name({required this.firstname, required this.lastname});

  @override
  String toString() {
    return "Name(firstname: '$firstname', lastname: '$lastname')";
  }
}
