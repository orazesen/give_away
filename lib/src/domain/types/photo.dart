class Photo {
  final String photoPath;
  final String photoUrl;

  Photo({required this.photoPath, required this.photoUrl});
  @override
  String toString() {
    return "PhotoUrl(photoUrl: '$photoPath', fullPhotoUrl: '$photoUrl')";
  }
}
