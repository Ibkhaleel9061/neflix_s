import 'package:dartz/dartz.dart';
import 'package:neflix_s/domain/core/failures/main_failure.dart';
import 'package:neflix_s/domain/search/model/search_resp/search_resp.dart';

//break down the purpose and benefits
abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery});
}
