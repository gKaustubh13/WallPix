import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpix/features/explore/view/widgets/explore_grid_view.dart';
import 'package:wallpix/features/explore/view_model/explore_view_model.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
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

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<ExploreViewModel>().fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExploreViewModel>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            elevation: 0,
            backgroundColor: theme.colorScheme.surface,
            foregroundColor: theme.colorScheme.onSurface,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Explore",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              titlePadding: const EdgeInsets.only(left: 24, bottom: 16),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 120,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected =
                      viewModel.selectedCategory == category['name'];

                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        context.read<ExploreViewModel>().changeCategory(
                          category['name'],
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? LinearGradient(
                                  colors: [
                                    category['color'].withOpacity(0.8),
                                    category['color'],
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : null,
                          color: isSelected
                              ? null
                              : theme.colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: category['color'].withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              category['icon'],
                              color: isSelected
                                  ? Colors.white
                                  : theme.colorScheme.onSurfaceVariant,
                              size: 24,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              category['name'],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : theme.colorScheme.onSurfaceVariant,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(child: ExploreGridView()),
        ],
      ),
    );
  }
}
