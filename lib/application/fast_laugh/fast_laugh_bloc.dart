import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/downloads/i_downloads_repos.dart';
import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

//reel Api url List
final dummyVideoUrls = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
];

ValueNotifier<Set<int>> likedVideosIdNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo _downlodsService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(
          // sending loading to ui
          const FastLaughState(
        videosList: [],
        isLoading: true,
        isError: false,
      ));
      // get trending movies
      final _result = await _downlodsService.getDownloadsImage();
      // log(_result.toString());
      final respon = _result.fold(
          (l) => FastLaughState(
                videosList: [],
                isError: true,
                isLoading: false,
              ),
          (r) => FastLaughState(
                videosList: r,
                isLoading: false,
                isError: false,
              ));
      // send to ui
      emit(respon);
    });
    on<LikeVideo>((event, emit) async {
      likedVideosIdNotifier.value.add(event.id);
      // ignore: invalid_use_of_protected_member
      likedVideosIdNotifier.notifyListeners();
    });
    on<UnlikeVideo>((event, emit) async {
      likedVideosIdNotifier.value.remove(event.id);
      // ignore: invalid_use_of_protected_member
      likedVideosIdNotifier.notifyListeners();
    });
  }
}
