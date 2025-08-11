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

  factory PhotoResponseModel.fromJsonString(String jsonString){
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
      nextPage: map["next_page"] as String,
    );
  }

  final int page;
  final int perPage;
  final int totalResults;
  final List<PhotoModel> photos;
  final String nextPage;
}

// {
//   "page": 1,
//   "per_page": 1,
//   "photos": [
//     {
//       "id": 2880507,
//       "width": 4000,
//       "height": 6000,
//       "url": "https://www.pexels.com/photo/woman-in-white-long-sleeved-top-and-skirt-standing-on-field-2880507/",
//       "photographer": "Deden Dicky Ramdhani",
//       "photographer_url": "https://www.pexels.com/@drdeden88",
//       "photographer_id": 1378810,
//       "avg_color": "#7E7F7B",
//       "src": {
//         "original": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg",
//         "large2x": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
//         "large": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
//         "medium": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&h=350",
//         "small": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&h=130",
//         "portrait": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
//         "landscape": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
//         "tiny": "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
//       },
//       "liked": false,
//       "alt": "Brown Rocks During Golden Hour"
//     }
//   ],
//   "next_page": "https://api.pexels.com/v1/curated/?page=2&per_page=1"
// }
