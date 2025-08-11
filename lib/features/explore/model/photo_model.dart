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
      url: map["url"] as String,
      photographer: map["photographer"] as String,
      photographerUrl: map["photographer_url"] as String? ?? '',// ✅ fixed typo
      photographerId: map["photographer_id"] as int,
      avgColor: map["avg_color"] as String,
      src: PhotoSrcModel.fromMap(map["src"] as Map<String, dynamic>),
      liked: map["liked"] as bool,
      alt: map["alt"] as String,
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
// {
//   "id": 2880507,
//   "width": 4000,
//   "height": 6000,
//   "url": "https://www.pexels.com/photo/woman-in-white-long-sleeved-top-and-skirt-standing-on-field-2880507/",
//   "photographer": "Deden Dicky Ramdhani",
//   "photographer_url": "https://www.pexels.com/@drdeden88",
//   "photographer_id": 1378810,
//   "avg_color": "#7E7F7B",
//   "src": {
//     "original": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg",
//     "large2x": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
//     "large": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
//     "medium": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&h=350",
//     "small": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&h=130",
//     "portrait": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
//     "landscape": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
//     "tiny": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
//   },
//   "liked": false,
//   "alt": "Brown Rocks During Golden Hour"
// }
