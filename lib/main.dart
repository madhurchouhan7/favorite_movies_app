import 'package:favorite_movies_app/provider/movie_provider.dart';
import 'package:favorite_movies_app/screens/home_page.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) => MovieProvider(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: "Favorite Movies App",
      home: const HomePage(),
    );
  }
}
