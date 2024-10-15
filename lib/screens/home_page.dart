// ignore_for_file: depend_on_referenced_packages

import 'package:favorite_movies_app/provider/movie_provider.dart';
import 'package:favorite_movies_app/screens/favorite_movies_screen.dart';
import 'package:favorite_movies_app/screens/movie_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Movies App"),
      ),
      // consumer
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          // getting list obj from class
          final movies = movieProvider.movies;

          // list view to show movies
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return InkWell(
                // on tap!
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsPage(movie: movie),
                    ),
                  );
                },
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //movie cover photo
                      Flexible(
                        flex: 6,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.asset(
                            //height: 300,
                            movie.coverPhoto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              IconButton(
                                icon: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      movie.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color:
                                          movie.isFavorite ? Colors.red : null,
                                    ),
                                    Text(
                                      movie.isFavorite
                                          ? 'Added to Favorite'
                                          : 'Add to Favorite!',
                                      style: TextStyle(
                                        fontWeight: movie.isFavorite
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  movieProvider.toggleFavorite(movie.id);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const FavoriteMoviesScreen(),
          ));
        },
        child: const Icon(Icons.favorite_rounded),
      ),
    );
  }
}
