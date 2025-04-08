import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/new_and_hot/hot_and_new_service.dart';
import '../../domain/new_and_hot/model/discover.dart';

part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';
part 'new_and_hot_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    // get hot and new movie data
    on<LoadDataInComingSoon>((event, emit) async {
      // send loading to ui
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      // get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();
      // data in state
      final newState = _result.fold((MainFailure f) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewDataResp resp) {
        return HotAndNewState(
            comingSoonList: resp.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: false);
      });
      emit(newState);
    });
    // get hot and new tv data
    on<LoadDataInEveryOnesWatching>((event, emit) async {
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      // get data from remote
      final _result = await _hotAndNewService.getHotAndNewTvData();
      // data in state
      final newState = _result.fold((MainFailure f) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewDataResp resp) {
        return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyOneIsWatchingList: resp.results,
            isLoading: false,
            hasError: false);
      });
      emit(newState);
    });
  }
}
