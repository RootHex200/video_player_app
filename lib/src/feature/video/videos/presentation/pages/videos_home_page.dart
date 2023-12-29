import 'package:flutter/material.dart';
import 'package:video_player/src/core/common/space.dart';
import 'package:video_player/src/core/values/colors.dart';
import 'package:video_player/src/core/values/text_style.dart';

class VideoHomePage extends StatelessWidget {
  const VideoHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //title
            const Padding(
              padding: EdgeInsets.only(left: 20,top: 30),
              child: Text("Trending Videos",style: headingTextStyle,)),
            const VerticalSpace(height: 10),
            //list of vidoes
            ListView.builder(
              padding: EdgeInsets.zero,
            itemCount: 10,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context,index){
              return Container(
                margin: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 12),
                decoration: BoxDecoration(
                  color:Appcolors.whitecolor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child:   Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //thumbail image
                    SizedBox(
                      height: 220,
                      child:Stack(
                      children: [
                      const Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Image(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage("https://mahfilbucket.s3.amazonaws.com/media_test/video_content_thumbnail/mob_thumbnail_HcaCk3ZbD1_1920x1080_7.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5G25YRBXUVQTFY73%2F20231228%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20231228T153728Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=e87c2567698c9de5e083352328d0933eec8eac0e18e713284338a9f7e096ed90")),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 6,
                        child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                        // margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        decoration:  BoxDecoration(
                          color: Appcolors.blackColor,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: const Text("3.40",style: durationTextStyle,),
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
                         const CircleAvatar(
                           radius: 25,
                           backgroundImage:NetworkImage("https://mahfilbucket.s3.amazonaws.com/media_test/channel_image/mob_image_M71gtbYNUE_5.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5G25YRBXUVQTFY73%2F20231229%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20231229T042046Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=2207132d4ed69040cac01713bc6a21eebe11421f986af157e536d2d1bb1b7327") ,
                         ),
                         const HorizontalSpace(width: 8),
                         //title
                         SizedBox(
                           height: 100,
                           width: MediaQuery.of(context).size.width -140,
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("সে যদি দুই রাকাত নামাজ পড়ে_Abu Taha Muhammad Adnan__Message of Life_",overflow: TextOverflow.ellipsis,textAlign: TextAlign.left,maxLines: 2,style: videotitleTextStyle,),
                              RichText(text: const TextSpan(
                                children: [
                                  TextSpan(text: "53,245 views . ",style: secondaryTextStyle),
                                  TextSpan(text: "Feb 21,2022",style: secondaryTextStyle)
                                ]
                              ))
                            ],
                           ),
                         ),
                         // const HorizontalSpace(width: 8),
                         const Icon(Icons.more_vert,color: Appcolors.secondaryColor,size: 40,)
                         //menu bar
                       ],
                     ),
                                    
                  ],
                ),
              );
          })
          ],
        ),
      ),
    );
  }
}