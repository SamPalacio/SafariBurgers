import 'package:flutter/material.dart';
import 'package:flutter_application/hamburguers.dart';
import 'homeview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 249, 232, 199),
          secondary: const Color(0xFFFFC107),

          // or from RGB
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomeView(),
    );
  }
}
