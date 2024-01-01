
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_flutter/src/feature/video/details/presentation/bloc/video_event.dart';
import 'package:video_player_flutter/src/feature/video/details/presentation/bloc/video_play_bloc.dart';
import 'package:video_player_flutter/src/feature/video/details/presentation/bloc/video_state.dart';
class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key,required this.thumbnail,required this.videourl});
  final String videourl;
  final String thumbnail;
  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  // ignore: prefer_typing_uninitialized_variables
  var chewieController;
  late VideoPlayerController videoPlayerController;
  @override
  void initState(){
    context.read<VideoPlayBloc>().add(VideoPlayDispose());
 // ignore: deprecated_member_use
 videoPlayerController = VideoPlayerController.network(
    widget.videourl,
    );
  scheduleMicrotask(() async{ 
    await videoPlayerController.initialize();
           chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          looping: true
        );
        // ignore: use_build_context_synchronously
        context.read<VideoPlayBloc>().add(VideoPlay());
  });
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<VideoPlayBloc, VideoPlayState>(
      builder: (context, state) {
        return state is VideoPlayInitial || chewieController==null?Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.thumbnail))
              ),
            ):Chewie(controller: chewieController);
      },
    );
  }
}