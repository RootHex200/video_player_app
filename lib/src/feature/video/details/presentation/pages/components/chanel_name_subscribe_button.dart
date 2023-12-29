import 'package:flutter/material.dart';
import 'package:video_player_flutter/src/core/common/space.dart';
import 'package:video_player_flutter/src/core/values/colors.dart';
import 'package:video_player_flutter/src/core/values/text_style.dart';

class ChannelNameSubscribeButton extends StatelessWidget {
  const ChannelNameSubscribeButton({
    super.key,
    required this.channelname,
    required this.channelimage,
    required this.subscriber
  });
  final String channelname;
  final String channelimage;
  final String subscriber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          //chanel image
           CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                channelimage.toString()),
          ),
          const HorizontalSpace(width: 17),
          //name
           SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  channelname.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: videotitleTextStyle,
                ),
                Text(
                  "$subscriber Subscribers",
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
