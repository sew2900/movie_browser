import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  static const String _apiKey = 'API_KEY';
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<Movie> movies = (data['results'] as List).map((e) => Movie.fromJson(e)).toList();
        return movies;
      } else {
        // Obsługa błędów odpowiedzi serwera
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (error) {
      // Obsługa błędów sieciowych lub innych
      throw Exception('Failed to load movies: $error');
    }
  }
}
