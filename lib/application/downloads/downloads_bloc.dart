import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neflix_s/domain/downloads/i_downloads_repos.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  //Constructor:IDownloadsRepo _downloadsRepo: An instance of the download repository, injected via constructor (dependency injection).

  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.inital()) {
    on<_GetDownloadsImage>((event, emit) async {
      //This line registers an event handler for the _GetDownloadsImage event. Whenever this event is triggered, the code inside this block will run.
      emit(
        //Initial State Change:
        state.copyWith(
          isLoading: true,
          downloadsFailureSucessOption: none(),
        ),
      );
      //Initial State Change: left or  right
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImage();
      //log(downloadsOption.toString()); print the data in terminal

      //Handling the Result:fold is used to handle both failure and success cases
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsFailureSucessOption: Some(
              Left(failure),
            ),
          ),
          (sucess) => state.copyWith(
            isLoading: false,
            downloads: sucess,
            downloadsFailureSucessOption: Some(
              Right(sucess),
            ),
          ),
        ),
      );
    });
  }
}


///
