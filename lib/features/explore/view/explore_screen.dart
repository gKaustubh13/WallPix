import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpix/features/explore/bloc/explore_bloc.dart';
import 'package:wallpix/features/explore/bloc/explore_event.dart';
import 'package:wallpix/features/explore/service/explore_api_service.dart';
import 'widgets/explore_grid_view.dart';
import 'widgets/explore_app_bar.dart';
import 'widgets/category_list_view.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExploreBloc(ExploreApiService())..add(FetchPhotos('sports')),
      child: const ExploreView(),
    );
  }
}

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final List<Map<String, dynamic>> categories = [
    {'name': 'sports', 'icon': Icons.sports_soccer, 'color': Colors.orange},
    {'name': 'nature', 'icon': Icons.nature, 'color': Colors.green},
    {'name': 'cars', 'icon': Icons.directions_car, 'color': Colors.blue},
    {'name': 'animals', 'icon': Icons.pets, 'color': Colors.amber},
    {'name': 'cities', 'icon': Icons.location_city, 'color': Colors.grey},
    {'name': 'technology', 'icon': Icons.computer, 'color': Colors.purple},
    {'name': 'food', 'icon': Icons.restaurant, 'color': Colors.red},
    {'name': 'travel', 'icon': Icons.flight, 'color': Colors.teal},
    {'name': 'art', 'icon': Icons.palette, 'color': Colors.pink},
    {'name': 'music', 'icon': Icons.music_note, 'color': Colors.indigo},
  ];
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ExploreBloc>().add(FetchMorePhotos());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const ExploreAppBar(),
          CategoryListView(categories: categories),
          const ExploreGridView(),
        ],
      ),
    );
  }
}
