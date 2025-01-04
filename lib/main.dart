import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/movie_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MovieBrowserApp());
}

class MovieBrowserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => MovieProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer2<AuthProvider, ThemeProvider>(
        builder: (context, authProvider, themeProvider, child) {
          return MaterialApp(
            title: 'Movie Browser',
            theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: authProvider.isAuthenticated ? HomeScreen() : LoginScreen(),
          );
        },
      ),
    );
  }
}
