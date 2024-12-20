import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:neflix_s/core/api_end_points.dart';
import 'package:neflix_s/domain/core/failures/main_failure.dart';
import 'package:neflix_s/domain/search/model/search_resp/search_resp.dart';
import 'package:neflix_s/domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class searchImpl implements SearchService {
  @override //call the API URL path get the data
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure
            .serverFailure()); //domain/core/failures/main_failure.dart';
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure
          .clientFailure()); //domain/core/failures/main_failure.dart';
    }
  }
}
