import 'package:flutter/material.dart';
import 'package:media/core/core_styles.dart';
import 'package:media/home/view/screen/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: CoreStyles.textTheme,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
