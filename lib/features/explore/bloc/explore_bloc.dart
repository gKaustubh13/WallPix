import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:wallpix/features/explore/service/explore_api_service.dart';
import 'explore_event.dart';
import 'explore_state.dart';

const _duration = Duration(milliseconds: 500);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final ExploreApiService _exploreService;

  ExploreBloc(this._exploreService) : super(ExploreInitial()) {
    on<FetchPhotos>(_onFetchPhotos, transformer: debounce(_duration));
    on<FetchMorePhotos>(_onFetchMorePhotos, transformer: droppable());
  }

  Future<void> _onFetchPhotos(
    FetchPhotos event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.query.isEmpty) return;

    emit(ExploreLoading());
    try {
      final response = await _exploreService.getPhotos(
        category: event.query,
        page: 1,
        perPage: 10,
      );
      if (response != null) {
        emit(
          ExploreLoaded(
            photos: response.photos,
            page: response.page,
            totalResults: response.totalResults,
            searchQuery: event.query,
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
        try {
          final response = await _exploreService.getPhotos(
            category: currentState.searchQuery,
            page: currentState.page + 1,
            perPage: 10,
          );
          if (response != null) {
            emit(
              currentState.copyWith(
                photos: currentState.photos + response.photos,
                page: response.page,
              ),
            );
          }
        } catch (e) {
        }
      }
    }
  }
}
