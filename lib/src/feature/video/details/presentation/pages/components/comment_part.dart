

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player_flutter/src/core/common/space.dart';
import 'package:video_player_flutter/src/core/values/colors.dart';
import 'package:video_player_flutter/src/core/values/text_style.dart';

class CommentPart extends StatelessWidget {
  const CommentPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Comments 5.7k",
                style: secondaryTextStyle,
              ),
              Icon(
                CupertinoIcons.arrow_down_circle_fill,
                size: 20,
                color: Appcolors.secondaryColor,
              )
            ],
          ),
        ),
        const VerticalSpace(height: 15),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: const BoxDecoration(color: Appcolors.whitecolor),
          child: const TextField(
            decoration: InputDecoration(
                hintText: "Add comment",
                suffix: Icon(
                  Icons.send,
                  size: 25,
                  color: Appcolors.secondaryColor,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Appcolors.secondaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Appcolors.secondaryColor))),
          ),
        ),
        const VerticalSpace(height: 20),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://mahfilbucket.s3.amazonaws.com/media_test/channel_image/mob_image_M71gtbYNUE_5.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5G25YRBXUVQTFY73%2F20231229%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20231229T083851Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b2febbc66cbbbd625c2837714673f312bc7b96e542f7e5aaf9c6477233fc3c04"),
              ),
              const HorizontalSpace(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "Fahmida Khanom  ", style: textspanTextStyle),
                      TextSpan(
                          text: "3 days ago",
                          style: TextStyle(
                              fontSize: 15, color: Appcolors.secondaryColor)),
                    ]),
                  ),
                  const VerticalSpace(height: 8),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: const Text(
                          "In publishing and graphic design, Lorem "))
                ],
              )
            ],
          ),
        ),
        const VerticalSpace(height: 10),
      ],
    );
  }
}