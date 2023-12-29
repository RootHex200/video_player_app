import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:video_player_flutter/src/feature/video/root/data/model/video_model.dart';
import 'package:video_player_flutter/src/feature/video/root/domain/repositories/videos_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  @override
  Future<Either<Exception, VideoModel>> getAllVideos(int offset) async {
    try {
      Response response = await Dio().get(
          "https://test-ximit.mahfil.net/api/trending-video/$offset?format=json&page=1");
      if (response.statusCode == 200) {
        VideoModel videoModel = VideoModel.fromJson(response.data);
        return Right(videoModel);
      }
      return Left(Exception("Bad Request"));
    } catch (e) {
      log(
        'VideoRepositoryImpl.videos',
        error: e,
      );
      return Left(Exception(e));
    }
  }
}
