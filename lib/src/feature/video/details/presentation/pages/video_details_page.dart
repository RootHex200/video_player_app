import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player_flutter/src/core/common/space.dart';
import 'package:video_player_flutter/src/core/values/colors.dart';
import 'package:video_player_flutter/src/core/values/text_style.dart';
import 'package:video_player_flutter/src/feature/video/details/presentation/pages/components/chanel_name_subscribe_button.dart';
import 'package:video_player_flutter/src/feature/video/details/presentation/pages/components/comment_part.dart';
import 'package:video_player_flutter/src/feature/video/details/presentation/pages/components/option_button.dart';
import 'package:video_player_flutter/src/feature/video/details/presentation/pages/components/play_video.dart';

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start, children: [
        //back icon
        const Padding(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Icon(
              Icons.arrow_back,
              size: 40,
              color: Appcolors.blackColor,
            )),
        //video view
        Container(
          color: Colors.black.withOpacity(0.3),
          height: 250,
          child: const PlayVideo(),
        ),
        const VerticalSpace(height: 20),
        //video title
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "সে যদি দুই রাকাত নামাজ পড়ে_Abu Taha Muhammad Adnan__Message of Life_",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            maxLines: 2,
            style: videotitleTextStyle,
          ),
        ),
        const VerticalSpace(height: 10),
        //views and date
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: RichText(
              text: const TextSpan(children: [
            TextSpan(text: "53,245 views . ", style: textspanTextStyle),
            TextSpan(text: "3 Days ago", style: textspanTextStyle)
          ])),
        ),
        const VerticalSpace(height: 20),
        //react , like and share
        Container(
          height: 80,
          margin: const EdgeInsets.only(left: 20),
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            children: const [
              OptionButton(
                  name: "MASH ALLAH (12K)",
                  iconname: Icons.favorite_border_outlined,
                  width: 200),
              HorizontalSpace(width: 10),
              OptionButton(
                  name: "LIKE (12K)",
                  iconname: Icons.thumb_up_alt_outlined,
                  width: 100),
              HorizontalSpace(width: 10),
              OptionButton(name: "SHARE", iconname: Icons.share, width: 80),
              HorizontalSpace(width: 10),
              OptionButton(
                  name: "REPORT", iconname: Icons.outlined_flag, width: 80),
              HorizontalSpace(width: 10)
            ],
          ),
        ),
        const VerticalSpace(height: 20),
        //chanel name ,subscribe
        const ChanelNameSubscribeButton(),
        const VerticalSpace(height: 10),
        const Divider(
          height: 1,
          thickness: 0.7,
          color: Appcolors.secondaryColor,
        ),
        const VerticalSpace(height: 20),
        //comment
        const CommentPart(),
        const Divider(
          height: 1,
          thickness: 0.7,
          color: Appcolors.secondaryColor,
        ),
      ]),
    ));
  }
}
