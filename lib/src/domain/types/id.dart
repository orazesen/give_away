class Id {
  final String id;

  const Id({required this.id});

  factory Id.none() => const Id(id: '');

  @override
  String toString() {
    return "Id(id: '$id')";
  }
}
