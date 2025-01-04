import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/movie.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    return openDatabase(
      join(await getDatabasesPath(), 'movies.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE movies(id INTEGER PRIMARY KEY, title TEXT, overview TEXT, posterPath TEXT)",
        );
        await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)",
        );
      },
      version: 1,
    );
  }


  Future<void> insertMovie(Movie movie) async {
    final db = await database;
    await db.insert(
      'movies',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Movie>> getMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('movies');
    return List.generate(maps.length, (i) {
      return Movie(
        id: maps[i]['id'],
        title: maps[i]['title'],
        overview: maps[i]['overview'],
        posterPath: maps[i]['posterPath'],
      );
    });
  }

  Future<void> deleteMovie(int id) async {
    final db = await database;
    await db.delete(
      'movies',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Metody zarządzania użytkownikami
  Future<void> insertUser(String username, String password) async {
    final db = await database;
    await db.insert(
      'users',
      {'username': username, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUser(String username, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }
}
