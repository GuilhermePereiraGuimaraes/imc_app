import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imc_app/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: false,
          textTheme: GoogleFonts.josefinSansTextTheme()),
      debugShowCheckedModeBanner: true,
      home: const HomePage(),
    );
  }
}
