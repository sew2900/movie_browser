import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../models/movie.dart';

class RatedMoviesScreen extends StatefulWidget {
  @override
  _RatedMoviesScreenState createState() => _RatedMoviesScreenState();
}

class _RatedMoviesScreenState extends State<RatedMoviesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).loadRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Rated as the best', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: movieProvider.ratedMovies.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: movieProvider.ratedMovies.length,
        itemBuilder: (context, index) {
          final movie = movieProvider.ratedMovies[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              title: Text(movie.title, style: Theme.of(context).textTheme.bodyLarge),
              subtitle: Text(movie.overview, maxLines: 2, overflow: TextOverflow.ellipsis),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.secondary),
                onPressed: () {
                  movieProvider.deleteMovie(movie.id);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
