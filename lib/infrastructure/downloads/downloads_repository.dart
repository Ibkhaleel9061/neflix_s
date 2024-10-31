import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:neflix_s/core/api_end_points.dart';
import 'package:neflix_s/domain/core/failures/main_failure.dart';
import 'package:neflix_s/domain/downloads/i_downloads_repos.dart';
import 'package:neflix_s/domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response = await Dio(BaseOptions()).get(ApiEndPoints
          .downloads); //get(ApiEndPoints.downloads); call the API URL path get the data
      if (response.statusCode == 200 || response.statusCode == 201) {
        //
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        //log('Parsed Downloads List: $response');

        return Right(downloadsList);
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
