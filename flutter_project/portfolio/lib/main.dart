import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/main_screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ).copyWith(
            textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
          ),
      // darkTheme:
      //     ThemeData.from(
      //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
      //     ).copyWith(
      //       textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
      //     ),
      title: "Piyush Kumar",
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
