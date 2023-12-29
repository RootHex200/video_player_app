import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_flutter/src/core/common/space.dart';
import 'package:video_player_flutter/src/core/values/colors.dart';
import 'package:video_player_flutter/src/core/values/text_style.dart';
import 'package:video_player_flutter/src/feature/video/root/data/model/video_model.dart';
import 'package:video_player_flutter/src/feature/video/videos/presentation/bloc/video_bloc.dart';
import 'package:video_player_flutter/src/feature/video/videos/presentation/bloc/video_event.dart';
import 'package:video_player_flutter/src/feature/video/videos/presentation/bloc/video_state.dart';

class VideoHomePage extends StatefulWidget {
  const VideoHomePage({super.key});

  @override
  State<VideoHomePage> createState() => _VideoHomePageState();
}

class _VideoHomePageState extends State<VideoHomePage> {
  late final ScrollController scrollController;
  bool isLoading = true;
  List<Results> videoList = [];
  //temp offset count
  int offset=2;
    void onScroll() {
    if (!scrollController.hasClients) return;
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      
      context.read<VideoBloc>().add( FetchVideoData(offset: offset));
      offset=offset+1;
    }
  }

  @override
  void initState() {
    scrollController = ScrollController()..addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //title
          const Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                "Trending Videos",
                style: headingTextStyle,
              )),
          const VerticalSpace(height: 10),
          //list of vidoes
          BlocConsumer<VideoBloc, VideoState>(
            listener: (context, state) {
            if (state is VideoLoadedState) {
            videoList.addAll(state.videotList);
          }
          if (state is VideoErrorState) {
            Center(child: Text(state.message));
          }
          if (state is VideoDataNoMore) {
            //snackbar
            isLoading = false;
          }
            },
            builder: (context, state) {
    
              return videoList.isEmpty? const Center(
                  child: CircularProgressIndicator(),
                ): Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: videoList.length+1,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return index<videoList.length? Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, top: 0, bottom: 12),
                        decoration: BoxDecoration(
                            color: Appcolors.whitecolor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //thumbail image
                            SizedBox(
                              height: 220,
                              child: Stack(
                                children: [
                                   Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    top: 0,
                                    child: Image(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            videoList[index].thumbnail.toString())),
                                  ),
                                  Positioned(
                                    right: 8,
                                    bottom: 6,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      // margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Appcolors.blackColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child:  Text(
                                        videoList[index].duration.toString(),
                                        style: whiteColorTextStyle,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const VerticalSpace(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //channel image
                                 CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                      videoList[index].channelImage.toString()),
                                ),
                                const HorizontalSpace(width: 8),
                                //title
                                SizedBox(
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width - 140,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                       Text(
                                        videoList[index].title.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        style: videotitleTextStyle,
                                      ),
                                      RichText(
                                          text:  TextSpan(children: [
                                        TextSpan(
                                            text: "${videoList[index].viewers} views . ",
                                            style: textspanTextStyle),
                                        TextSpan(
                                            text: videoList[index].createdAt,
                                            style: textspanTextStyle)
                                      ]))
                                    ],
                                  ),
                                ),
                                // const HorizontalSpace(width: 8),
                                const Icon(
                                  Icons.more_vert,
                                  color: Appcolors.secondaryColor,
                                  size: 40,
                                )
                                //menu bar
                              ],
                            ),
                          ],
                        ),
                      ):Center(
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text("No more data"),
                            );
                    }),
                );
            },
          )
        ],
      ),
    );
  }
}
