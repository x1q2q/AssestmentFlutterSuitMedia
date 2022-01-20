import 'package:flutter/material.dart';
import 'ui/screens/first_screen.dart';
import 'ui/screens/second_screen.dart';
import 'ui/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuitMedia Test',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const FirstScreen(),
        '/second-screen': (context) => const SecondScreen(),
        '/third-screen': (context) => const ThirdScreen(),
      },
    );
  }
}

// by rafiknurf