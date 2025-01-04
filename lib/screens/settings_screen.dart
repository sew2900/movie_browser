import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Dark Mode', style: Theme.of(context).textTheme.bodyLarge),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleDarkMode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
