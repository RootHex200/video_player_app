

import 'package:dartz/dartz.dart';
import 'package:video_player_flutter/src/feature/video/root/data/model/video_model.dart';

abstract class VideoRepository{

  Future<Either<Exception,VideoModel>> getAllVideos(int offset);

}