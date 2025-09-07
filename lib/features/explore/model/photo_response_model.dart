import 'dart:convert';
import 'package:wallpix/features/explore/model/photo_model.dart';

class PhotoResponseModel {
  const PhotoResponseModel({
    required this.page,
    required this.perPage,
    required this.totalResults,
    required this.photos,
    required this.nextPage,
  });

  factory PhotoResponseModel.fromJsonString(String jsonString) {
    final Map<String, dynamic> map = json.decode(jsonString);
    return PhotoResponseModel.fromMap(map);
  }

  factory PhotoResponseModel.fromMap(Map<String, dynamic> map) {
    return PhotoResponseModel(
      page: map["page"] as int,
      perPage: map["per_page"] as int,
      totalResults: map["total_results"] as int,
      photos: (map["photos"] as List)
          .map((map) => PhotoModel.fromMap(map))
          .toList(),
      nextPage: map["next_page"] as String? ?? '',
    );
  }

  final int page;
  final int perPage;
  final int totalResults;
  final List<PhotoModel> photos;
  final String nextPage;
}
