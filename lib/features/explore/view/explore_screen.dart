import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpix/features/explore/bloc/explore_bloc.dart';
import 'package:wallpix/features/explore/bloc/explore_event.dart';
import 'package:wallpix/features/explore/service/explore_api_service.dart';
import 'widgets/explore_grid_view.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExploreBloc(ExploreApiService())..add(FetchPhotos('Minimal')),
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for wallpapers...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: theme.colorScheme.surfaceVariant,
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
          ),
          onChanged: (query) {
            context.read<ExploreBloc>().add(FetchPhotos(query));
          },
        ),
      ),
      body: ExploreGridView(controller: _scrollController),
    );
  }
}
