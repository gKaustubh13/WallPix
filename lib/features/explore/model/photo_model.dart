import 'package:wallpix/features/explore/model/photo_src_model.dart';

class PhotoModel {
  const PhotoModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      id: map["id"] as int,
      width: map["width"] as int,
      height: map["height"] as int,
      url: map["url"] as String? ?? '',
      photographer: map["photographer"] as String? ?? '',
      photographerUrl: map["photographer_url"] as String? ?? '',
      photographerId: map["photographer_id"] as int,
      avgColor: map["avg_color"] as String? ?? '',
      src: PhotoSrcModel.fromMap(map["src"] as Map<String, dynamic>),
      liked: map["liked"] as bool,
      alt: map["alt"] as String? ?? '',
    );
  }

  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final PhotoSrcModel src;
  final bool liked;
  final String alt;
}
