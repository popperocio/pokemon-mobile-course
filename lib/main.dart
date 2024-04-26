import 'package:flutter/material.dart';
import 'package:pokemon_mobile_course/views/splash_screen.dart';

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
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      initialRoute: "/splashScreen",
      routes: {
        "/splashScreen": (context) => const SplashScreen(),
      },
    );
  }
}
