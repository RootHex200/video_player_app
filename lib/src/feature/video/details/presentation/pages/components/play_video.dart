
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key});

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
  
    'https://bycwknztmq.gpcdn.net/9501704c-dc46-4915-ac37-58bc25331203/playlist.m3u8',
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
      color: Colors.red,
    ):Chewie(controller: chewieController);
  }
}