
import 'package:equatable/equatable.dart';

abstract class VideoPlayEvent extends Equatable{
  const VideoPlayEvent();
}

class VideoPlay extends VideoPlayEvent{
  @override
  List<Object?> get props => [];
}

class VideoPlayDispose extends VideoPlayEvent{
  @override
  List<Object?> get props =>[];

}