import 'package:favorite_movies_app/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier {
  final List<MovieModel> _movies = [
    MovieModel(
        id: 'M1',
        title: "Animal",
        coverPhoto: "lib/assets/movies_coverphoto/animal.jpg",
        description:
            'The hardened son of a powerful industrialist returns home after years abroad and vows to take bloody revenge on those threatening his fathers life. The hardened son of a powerful industrialist returns home after years abroad and vows to take bloody revenge on those threatening his fathers life.'),
    MovieModel(
        id: 'M2',
        title: "Inception",
        coverPhoto: "lib/assets/movies_coverphoto/inception.jpg",
        description:
            "Dom Cobb (Leonardo DiCaprio) is a thief with the rare ability to enter people's dreams and steal their secrets from their subconscious. His skill has made him a hot commodity in the world of corporate espionage but has also cost him everything he loves."),
    MovieModel(
        id: 'M3',
        title: "Interstellar",
        coverPhoto: "lib/assets/movies_coverphoto/interstellar.jpg",
        description:
            "Interstellar is about Earth's last chance to find a habitable planet before a lack of resources causes the human race to go extinct. The film's protagonist is Cooper (Matthew McConaughey), a former NASA pilot who is tasked with leading a mission through a wormhole to find a habitable planet in another galaxy."),
    MovieModel(
        id: 'M4',
        title: "The Dark Knight",
        coverPhoto: "lib/assets/movies_coverphoto/thedarkknight.jpg",
        description:
            "The plot follows the vigilante Batman, police lieutenant James Gordon, and district attorney Harvey Dent, who form an alliance to dismantle organized crime in Gotham City. Their efforts are derailed by the Joker, an anarchistic mastermind who seeks to test how far Batman will go to save the city from chaos."),
    MovieModel(
        id: 'M5',
        title: "The Martian",
        coverPhoto: "lib/assets/movies_coverphoto/themartian.jpg",
        description:
            "When astronauts blast off from the planet Mars, they leave behind Mark Watney (Matt Damon), presumed dead after a fierce storm. With only a meager amount of supplies, the stranded visitor must utilize his wits and spirit to find a way to survive on the hostile planet."),
    MovieModel(
        id: 'M6',
        title: "50 Shades of Grey",
        coverPhoto: "lib/assets/movies_coverphoto/fsog.jpg",
        description:
            "When astronauts blast off from the planet Mars, they leave behind Mark Watney (Matt Damon), presumed dead after a fierce storm. With only a meager amount of supplies, the stranded visitor must utilize his wits and spirit to find a way to survive on the hostile planet."),
    MovieModel(
        id: 'M7',
        title: "Stree 2",
        coverPhoto: "lib/assets/movies_coverphoto/stree2.jpg",
        description:
            "Following the events of the first film, Stree leave Chanderi. Years later, Chanderi faces a new threat in the form of Sarkata, a headless ghost, who abducts women at night. The townspeople, unaware of this, mistakenly believe the missing women have left for better prospects."),
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
