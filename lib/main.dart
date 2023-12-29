import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_flutter/src/core/values/colors.dart';
import 'package:video_player_flutter/src/feature/video/videos/presentation/bloc/video_bloc.dart';
import 'package:video_player_flutter/src/feature/video/videos/presentation/bloc/video_event.dart';
import 'package:video_player_flutter/src/feature/video/videos/presentation/pages/videos_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VideoBloc>(
          create: (context) => VideoBloc()..add(const FetchVideoData(offset: 1)),
        )
      ],
      child: MaterialApp(
        title: 'Video Player',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Appcolors.primarybg
        ),
        home: const VideoHomePage(),
      ),
    );
  }
}
