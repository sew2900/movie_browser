import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // Hasło jest wykropkowane
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_usernameController.text.length < 2 || _passwordController.text.length < 2) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Username and password must be at least 2 characters long.')),
                  );
                  return;
                }

                try {
                  await authProvider.signIn(
                    _usernameController.text,
                    _passwordController.text,
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login failed: $e')),
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () async {
                if (_usernameController.text.length < 2 || _passwordController.text.length < 2) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Username and password must be at least 2 characters long.')),
                  );
                  return;
                }

                try {
                  await authProvider.signUp(
                    _usernameController.text,
                    _passwordController.text,
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Signup failed: $e')),
                  );
                }
              },
              child: Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
