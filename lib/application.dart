import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpix/features/explore/view/explore_screen_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExploreScreenProvider(),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
    );
  }
}
