import 'package:wallpix/features/explore/model/photo_model.dart';

abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<PhotoModel> photos;
  final int page;
  final int totalResults;
  final String searchQuery;
  final bool isLoadingMore;

  ExploreLoaded({
    required this.photos,
    required this.page,
    required this.totalResults,
    required this.searchQuery,
    this.isLoadingMore = false,
  });

  ExploreLoaded copyWith({
    List<PhotoModel>? photos,
    int? page,
    bool? isLoadingMore,
  }) {
    return ExploreLoaded(
      photos: photos ?? this.photos,
      page: page ?? this.page,
      totalResults: totalResults,
      searchQuery: searchQuery,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class ExploreError extends ExploreState {
  final String message;

  ExploreError(this.message);
}
