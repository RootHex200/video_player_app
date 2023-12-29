import 'package:flutter/material.dart';
import 'package:video_player/src/core/values/colors.dart';
import 'package:video_player/src/feature/video/videos/presentation/pages/videos_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Appcolors.primarybg
      ),
      home: const VideoHomePage(),
    );
  }
}
