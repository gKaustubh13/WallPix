import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpix/features/explore/service/explore_api_service.dart';
import 'explore_event.dart';
import 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final ExploreApiService _exploreService;

  ExploreBloc(this._exploreService) : super(ExploreInitial()) {
    on<FetchPhotos>(_onFetchPhotos);
    on<FetchMorePhotos>(_onFetchMorePhotos);
    on<ChangeCategory>(_onChangeCategory);
  }

  Future<void> _onFetchPhotos(
    FetchPhotos event,
    Emitter<ExploreState> emit,
  ) async {
    emit(ExploreLoading());
    try {
      final response = await _exploreService.getPhotos(
        category: event.category,
        page: 1,
        perPage: 10,
      );
      if (response != null) {
        emit(
          ExploreLoaded(
            photos: response.photos,
            page: response.page,
            totalResults: response.totalResults,
            selectedCategory: event.category,
          ),
        );
      } else {
        emit(ExploreError('Failed to fetch photos.'));
      }
    } catch (e) {
      emit(ExploreError(e.toString()));
    }
  }

  Future<void> _onFetchMorePhotos(
    FetchMorePhotos event,
    Emitter<ExploreState> emit,
  ) async {
    if (state is ExploreLoaded) {
      final currentState = state as ExploreLoaded;
      if (currentState.photos.length < currentState.totalResults) {
        emit(currentState.copyWith(isLoadingMore: true));
        try {
          final response = await _exploreService.getPhotos(
            category: currentState.selectedCategory,
            page: currentState.page + 1,
            perPage: 10,
          );
          if (response != null) {
            emit(
              currentState.copyWith(
                photos: currentState.photos + response.photos,
                page: response.page,
                isLoadingMore: false,
              ),
            );
          }
        } catch (e) {
          emit(currentState.copyWith(isLoadingMore: false));
        }
      }
    }
  }

  void _onChangeCategory(ChangeCategory event, Emitter<ExploreState> emit) {
    add(FetchPhotos(event.category));
  }
}
