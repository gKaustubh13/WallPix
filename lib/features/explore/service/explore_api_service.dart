import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:wallpix/features/explore/model/photo_response_model.dart';

class ExploreApiService {
  final Client _client = Client();
  final _apiKey = dotenv.env['API_KEY'];

  Future<PhotoResponseModel?> getPhotos({
    required String category,
    int page = 1,
    int perPage = 10,
  }) async {
    final uri = Uri.parse(
      "https://api.pexels.com/v1/search?query=$category&page=$page&per_page=$perPage",
    );

    final response = await _client.get(
      uri,
      headers: {"Authorization": _apiKey ?? ""},
    );

    if (response.statusCode == 200) {
      return PhotoResponseModel.fromJsonString(response.body);
    }
    return null;
  }
}
