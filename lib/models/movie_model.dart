class MovieModel {
  final String id;
  final String title;
  final String coverPhoto;
  final String description;
  bool isFavorite;

  MovieModel({
    required this.coverPhoto,
    required this.id,
    required this.title,
    required this.description,
    this.isFavorite = false,
  });
}
