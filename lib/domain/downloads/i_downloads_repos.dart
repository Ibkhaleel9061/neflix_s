import 'package:dartz/dartz.dart';
import 'package:neflix_s/domain/downloads/models/downloads.dart';

import '../core/failures/main_failure.dart';

//break down the purpose and benefits
abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage();
}
