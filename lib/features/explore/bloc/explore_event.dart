abstract class ExploreEvent {}

class FetchPhotos extends ExploreEvent {
  final String query;

  FetchPhotos(this.query);
}

class FetchMorePhotos extends ExploreEvent {}
