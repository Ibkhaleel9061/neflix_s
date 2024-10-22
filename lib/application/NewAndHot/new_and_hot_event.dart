part of 'new_and_hot_bloc.dart';

@freezed
class HotAndNewEvent with _$HotAndNewEvent {
  const factory HotAndNewEvent.loadDataInComingSoon() = LoadDataInComingSoon;
  const factory HotAndNewEvent.loadDataInEveryOnesWatching() =
      LoadDataInEveryOnesWatching;
}
