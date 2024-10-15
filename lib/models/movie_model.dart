class MovieModel {
  final String id;
  final String title;
  final String coverPhoto;
  bool isFavorite;

  MovieModel({
    required this.coverPhoto,
    required this.id,
    required this.title,
    this.isFavorite = false,
  });
}
