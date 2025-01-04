import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';
import '../services/database_helper.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  List<Movie> _ratedMovies = [];
  List<Movie> get ratedMovies => _ratedMovies;

  String? _error;
  String? get error => _error;

  Future<void> fetchMovies() async {
    try {
      _movies = await ApiService().fetchMovies();
      _error = null; // Resetowanie błędu po udanym pobraniu
    } catch (error) {
      _error = error.toString(); // Przechowywanie komunikatu błędu
      } notifyListeners();
  }

  Future<void> saveMovie(Movie movie) async {
    await DatabaseHelper().insertMovie(movie);
    await loadRatedMovies();  // Upewnij się, że załadujemy ocenione filmy po ich zapisaniu
  }

  Future<void> loadRatedMovies() async {
    _ratedMovies = await DatabaseHelper().getMovies();
    notifyListeners();
  }

  Future<void> deleteMovie(int id) async {
    await DatabaseHelper().deleteMovie(id);
    await loadRatedMovies();  // Odśwież listę ocenionych filmów po usunięciu
  }
}
