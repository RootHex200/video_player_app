

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_flutter/src/feature/video/details/presentation/bloc/video_event.dart';
import 'package:video_player_flutter/src/feature/video/details/presentation/bloc/video_state.dart';
class VideoPlayBloc extends Bloc<VideoPlayEvent, VideoPlayState> {
  VideoPlayBloc() : super(VideoPlayInitial()) {
    on<VideoPlay>((event, emit) {
      emit(VideoPlayStart());
    });

    on<VideoPlayDispose>((event, emit){
      log("dispose state");
      emit(VideoPlayInitial());
    });
  }
}