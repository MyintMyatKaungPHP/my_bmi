import 'package:flutter/material.dart';
import 'package:my_bmi/components/theme.dart';
import 'package:my_bmi/screens/input_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.light;

  IconData get _themeModeIcon {
    switch (_themeMode) {
      case ThemeMode.light:
        return Icons.dark_mode;
      case ThemeMode.dark:
        return Icons.light_mode;
      default:
        return Icons.light_mode;
    }
  }

  void _toggleThemeMode() {
    setState(() {
      _themeMode = (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme().lightTheme,
      darkTheme: CustomTheme().darkTheme,
      themeMode: _themeMode,  // Add this line to toggle between light and dark themes
      title: 'BMI Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          actions: [
            IconButton(
              icon: Icon(_themeModeIcon),
              onPressed: _toggleThemeMode,
            ),
          ],
        ),
        body: InputPage(),
      ),
    );
  }
}
