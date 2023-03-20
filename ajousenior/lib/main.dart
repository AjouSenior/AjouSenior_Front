import 'package:ajousenior/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

const seedColor = Color.fromARGB(255, 132, 39, 238);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: seedColor, brightness: Brightness.dark),
          textTheme: GoogleFonts.notoSansNKoTextTheme(
            Theme.of(context).textTheme,
          )),
      home: const HomeScreen(),
    );
  }
}
