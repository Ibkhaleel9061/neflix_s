import 'package:neflix_s/core/strings.dart';
import 'package:neflix_s/infrastructure/API_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$api_key";
  static const search = '$kBaseUrl/search/movie?api_key=$api_key';
  static const hotAndNewMovie = '$kBaseUrl/discover/movie?api_key=$api_key';
  static const hotAndNewTv = '$kBaseUrl/discover/tv?api_key=$api_key';
}
