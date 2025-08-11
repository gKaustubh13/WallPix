import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpix/features/explore/view/explore_screen.dart';
import 'package:wallpix/features/explore/view_model/explore_view_model.dart';

class ExploreScreenProvider extends StatelessWidget {
  const ExploreScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExploreViewModel(),
      child: ExploreScreen(),
    );
  }
}
