
import 'package:equatable/equatable.dart';

abstract class VideoEvent extends Equatable{
  const VideoEvent();
  @override
  List<Object> get props => [];
}

class FetchVideoData extends VideoEvent{
  final int offset;
  const FetchVideoData({required this.offset});
  @override
  List<Object> get props => [];
}