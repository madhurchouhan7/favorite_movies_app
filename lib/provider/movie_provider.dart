import 'package:favorite_movies_app/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier {
  final List<MovieModel> _movies = [
    MovieModel(
      id: 'M1',
      title: "Animal",
      coverPhoto: "lib/assets/movies_coverphoto/animal.jpg",
    ),
    MovieModel(
      id: 'M2',
      title: "Inception",
      coverPhoto: "lib/assets/movies_coverphoto/inception.jpg",
    ),
    MovieModel(
      id: 'M3',
      title: "Interstellar",
      coverPhoto: "lib/assets/movies_coverphoto/interstellar.jpg",
    ),
    MovieModel(
      id: 'M4',
      title: "The Dark Knight",
      coverPhoto: "lib/assets/movies_coverphoto/thedarkknight.jpg",
    ),
    MovieModel(
      id: 'M5',
      title: "The Martian",
      coverPhoto: "lib/assets/movies_coverphoto/themartian.jpg",
    ),
    MovieModel(
      id: 'M6',
      title: "50 Shades of Grey",
      coverPhoto: "lib/assets/movies_coverphoto/fsog.jpg",
    ),
    MovieModel(
      id: 'M7',
      title: "Stree 2",
      coverPhoto: "lib/assets/movies_coverphoto/stree2.jpg",
    ),
  ];

  List<MovieModel> get movies {
    return [..._movies];
  }

  List<MovieModel> get favoriteMovies {
    return _movies.where((movies) => movies.isFavorite).toList();
  }

  // method to toggle favorite status of a movie
  void toggleFavorite(String id) {
    final movieIndex = _movies.indexWhere((movies) => movies.id == id);
    if (movieIndex >= 0) {
      _movies[movieIndex].isFavorite = !_movies[movieIndex].isFavorite;
      notifyListeners();
    }
  }
}
