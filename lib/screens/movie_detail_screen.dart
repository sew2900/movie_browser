import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieTitle;
  final Movie movie;

  MovieDetailScreen({required this.movieTitle, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieTitle, style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'movie_${movie.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                movie.overview,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Provider.of<MovieProvider>(context, listen: false).saveMovie(movie);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Movie saved!')));
                },
                child: Text('Rate as the best'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
