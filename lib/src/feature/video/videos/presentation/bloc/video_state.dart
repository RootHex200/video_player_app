import 'package:equatable/equatable.dart';
import 'package:video_player_flutter/src/feature/video/root/data/model/video_model.dart';

abstract class VideoState extends Equatable{
  const VideoState();
  @override
  List<Object> get props => [];
}

class VideoInitialState extends VideoState{
  @override
  List<Object> get props => [];
}


class VideoLoadingState extends VideoState{
  const VideoLoadingState();
  @override
  List<Object> get props => [];
}

class VideoLoadedState extends VideoState{
  final List<Results> videotList;
  const VideoLoadedState({required this.videotList});
  @override
  List<Object> get props => [videotList];
}

class VideoErrorState extends VideoState{
  final String message;
  const VideoErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class VideoDataNoMore extends VideoState{
  const VideoDataNoMore();
  @override
  List<Object> get props => [];
}