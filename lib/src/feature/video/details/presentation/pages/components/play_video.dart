
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key,required this.thumbnail,required this.videourl});
  final String videourl;
  final String thumbnail;
  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late ChewieController chewieController;
  late VideoPlayerController videoPlayerController;
  var ishumbailshow=true;
  @override
  void initState(){
 videoPlayerController = VideoPlayerController.network(
  
    widget.videourl,
    );

  scheduleMicrotask(() async{ 
    await videoPlayerController.initialize();
  });

  scheduleMicrotask(() async{ 
    await Future.delayed(const Duration(seconds: 1),(){
       chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          looping: true
        );
        setState(() {
          ishumbailshow=false;
        });
    });
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
    return  ishumbailshow?Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.thumbnail))
      ),
    ):Chewie(controller: chewieController);
  }
}