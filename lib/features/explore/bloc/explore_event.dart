abstract class ExploreEvent {}

class FetchPhotos extends ExploreEvent {
  final String category;

  FetchPhotos(this.category);
}

class FetchMorePhotos extends ExploreEvent {}

class ChangeCategory extends ExploreEvent {
  final String category;

  ChangeCategory(this.category);
}
