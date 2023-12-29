import 'package:flutter/material.dart' show StatelessWidget,IconData,Widget,BuildContext,Container,BoxDecoration,BorderRadius,Border,BorderStyle,Column,Icon,Text;
import 'package:video_player_flutter/src/core/common/space.dart';
import 'package:video_player_flutter/src/core/values/colors.dart';
import 'package:video_player_flutter/src/core/values/text_style.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({super.key,required this.name,required this.iconname,required this.width});
  final String name;
  final IconData iconname;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: width,
      decoration: BoxDecoration(
          color: Appcolors.whitecolor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Appcolors.secondaryColor, style: BorderStyle.solid)),
      child:  Column(
        children: [
          //icon
          const VerticalSpace(height: 8),
          Icon(
            iconname,
            color: Appcolors.secondaryColor,
            size: 30,
          ),
          const VerticalSpace(height: 10),
          Text(
            name.toString(),
            style: secondaryTextStyle,
          )
        ],
      ),
    );
  }
}
