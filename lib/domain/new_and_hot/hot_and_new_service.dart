import 'package:dartz/dartz.dart';

import 'package:neflix_s/domain/new_and_hot/model/discover.dart';

import '../core/failures/main_failure.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewDataResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNewDataResp>> getHotAndNewTvData();
}
