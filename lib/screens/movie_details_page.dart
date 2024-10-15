import 'package:favorite_movies_app/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                movie.coverPhoto,
                height: 500,
              ),

              //space
              const SizedBox(
                height: 20,
              ),
              Text(
                movie.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              //space
              const SizedBox(
                height: 20,
              ),

              // description of movie!
              Text(
                movie.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
