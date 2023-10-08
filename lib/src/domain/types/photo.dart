class Photo {
  final String url;

  const Photo({required this.url});

  @override
  String toString() {
    return "Photo(url: '$url')";
  }
}
