
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_flutter/src/feature/video/root/data/repositories/vidoes_repository_impl.dart';
import 'package:video_player_flutter/src/feature/video/videos/presentation/bloc/video_event.dart';
import 'package:video_player_flutter/src/feature/video/videos/presentation/bloc/video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoInitialState()) {
    
    on<FetchVideoData>((event, emit) async {
      emit(const VideoLoadingState());
      try {
        final postList = await VideoRepositoryImpl().getAllVideos(event.offset);

        postList.fold((l) {
          log(
            'videoBloc.video list',
            error: l,
          );
          emit(VideoErrorState(message: l.toString()));

        }, (r) {
          if (r.results!.length<5) {
          emit(const VideoDataNoMore());
          log("data no more");
          }else{
            emit(VideoLoadedState(videotList: r.results!));
          }
          
        });

      } catch (e) {
        emit(VideoErrorState(message: e.toString()));
      }
    });
  }
}