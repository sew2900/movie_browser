import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import 'movie_detail_screen.dart';
import 'rated_movies_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Pobranie filmów przy inicjalizacji ekranu
    Provider.of<MovieProvider>(context, listen: false).fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    // Uzyskanie dostępu do MovieProvider za pomocą provider
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Browser', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          // Przycisk do nawigacji do ekranu ustawień
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
          // Przycisk do nawigacji do ekranu ocenionych filmów
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RatedMoviesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      // Sprawdzenie, czy wystąpił błąd
      body: movieProvider.error != null
      // Wyświetlenie komunikatu błędu, jeśli wystąpił błąd
          ? Center(child: Text('Error: ${movieProvider.error}'))
      // Wyświetlenie wskaźnika ładowania, jeśli lista filmów jest pusta
          : movieProvider.movies.isEmpty
          ? Center(child: CircularProgressIndicator())
      // Wyświetlenie listy filmów za pomocą ListView.builder, gdy filmy są pobrane
          : ListView.builder(
        itemCount: movieProvider.movies.length,
        itemBuilder: (context, index) {
          final movie = movieProvider.movies[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              title: Text(movie.title, style: Theme.of(context).textTheme.bodyLarge),
              subtitle: Text(movie.overview, maxLines: 2, overflow: TextOverflow.ellipsis),
              leading: Hero(
                tag: 'movie_${movie.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(
                      movieTitle: movie.title,
                      movie: movie,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
