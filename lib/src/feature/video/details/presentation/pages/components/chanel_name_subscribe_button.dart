import 'package:flutter/material.dart';
import 'package:video_player_flutter/src/core/common/space.dart';
import 'package:video_player_flutter/src/core/values/colors.dart';
import 'package:video_player_flutter/src/core/values/text_style.dart';

class ChanelNameSubscribeButton extends StatelessWidget {
  const ChanelNameSubscribeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          //chanel image
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://mahfilbucket.s3.amazonaws.com/media_test/channel_image/mob_image_M71gtbYNUE_5.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5G25YRBXUVQTFY73%2F20231229%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20231229T083851Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b2febbc66cbbbd625c2837714673f312bc7b96e542f7e5aaf9c6477233fc3c04"),
          ),
          const HorizontalSpace(width: 17),
          //name
          const SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Mega Bangla TV",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: videotitleTextStyle,
                ),
                Text(
                  "3M Subscribers",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: secondaryTextStyle,
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          //subscribebutton
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
                color: Appcolors.subscribeColor,
                borderRadius: BorderRadius.circular(8)),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  size: 30,
                  color: Appcolors.whitecolor,
                ),
                VerticalSpace(height: 10),
                Text(
                  "Subscribe",
                  style: whiteColorTextStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
