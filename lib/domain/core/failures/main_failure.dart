import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

//automatically. Here's a breakdown of what each part of your code does:
@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure() =
      _clientFailure; //A client error occurred
  const factory MainFailure.serverFailure() =
      _serverFailure; //A server error occurred.
}
