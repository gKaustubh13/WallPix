import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:wallpix/features/explore/model/photo_model.dart';
import 'package:wallpix/features/explore/service/explore_api_service.dart';

class ExploreViewModel extends ChangeNotifier {
  final _service = ExploreApiService();

  List<PhotoModel> _photos = [];
  UnmodifiableListView<PhotoModel> get photos => UnmodifiableListView(_photos);

  int _page = 1;
  int _totalResults = 0;
  String _selectedCategory = "sports"; // default

  bool isLoading = false;
  bool isLoadingMore = false;

  String get selectedCategory => _selectedCategory;

  void changeCategory(String category) {
    _selectedCategory = category;
    _page = 1;
    _photos.clear();
    fetch();
  }

  Future<void> fetch() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getPhotos(
      category: _selectedCategory,
      page: 1,
      perPage: 10,
    );

    if (response != null) {
      _photos = response.photos;
      _page = response.page;
      _totalResults = response.totalResults;
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMore() async {
    if (isLoadingMore || _photos.isEmpty) return;

    if (_totalResults > _photos.length) {
      isLoadingMore = true;
      notifyListeners();

      final response = await _service.getPhotos(
        category: _selectedCategory,
        page: _page + 1,
        perPage: 10,
      );

      if (response != null) {
        _photos = [..._photos, ...response.photos];
        _page = response.page;
        _totalResults = response.totalResults;
      }

      isLoadingMore = false;
      notifyListeners();
    }
  }
}
