import 'package:flutter/material.dart';
import '../services/database_helper.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> signIn(String username, String password) async {
    final user = await DatabaseHelper().getUser(username, password);
    if (user != null) {
      _isAuthenticated = true;
      notifyListeners();
    } else {
      throw Exception('Invalid username or password');
    }
  }

  Future<void> signUp(String username, String password) async {
    if (username.length < 2 || password.length < 2) {
      throw Exception('Username and password must be at least 2 characters long.');
    }
    await DatabaseHelper().insertUser(username, password);
    _isAuthenticated = true;
    notifyListeners();
  }

  void signOut() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
