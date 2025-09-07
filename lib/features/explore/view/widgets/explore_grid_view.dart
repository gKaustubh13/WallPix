import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpix/features/explore/bloc/explore_bloc.dart';
import 'package:wallpix/features/explore/bloc/explore_state.dart';
import 'photo_card.dart';

class ExploreGridView extends StatelessWidget {
  final ScrollController controller;

  const ExploreGridView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        if (state is ExploreLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ExploreLoaded) {
          if (state.photos.isEmpty) {
            return const Center(child: Text("No results found."));
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              controller: controller,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                return PhotoCard(photo: state.photos[index], index: index);
              },
            ),
          );
        }
        if (state is ExploreError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
