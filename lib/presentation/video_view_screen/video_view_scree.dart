import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:video_player/video_player.dart';

class VideoViewScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const VideoViewScreen({
    this.path, 
    this.mediaFile,
    this.deliver
    });

  final String? path;
  final File? mediaFile;
  final String? deliver;

  @override
  State<VideoViewScreen> createState() => _VideoViewScreenState();
}

class _VideoViewScreenState extends State<VideoViewScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    String filePath = widget.mediaFile?.path ?? "";
    // TODO: implement initState
   widget.deliver != null ?
   _controller = VideoPlayerController.networkUrl(
    Uri.parse(widget.deliver ?? ''))
   : _controller = VideoPlayerController.file(
        widget.path != null 
        ? File(widget.path ?? '') 
        : File(filePath))
      ..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
          height: getVerticalSize(60),
          leadingWidth: 45,
          leading: Align(
            alignment: Alignment.centerLeft,
            child: AppbarImage(
                onTap: () {
                  onTapArrowleft8();
                },
                svgPath: ImageConstant.imgArrowleftGray600,
                height: getSize(30),
                width: getSize(30),
                margin: getMargin(left: 10, top: 5, bottom: 20, right: 10)),
          ),
          actions: <Widget>[
            widget.path != null
                ? IconButton(
                    icon: Icon(
                      Icons.crop_rotate,
                      size: 27,
                      color: ColorConstant.black900,
                    ),
                    onPressed: () {},
                  )
                : SizedBox.shrink(),
            widget.path != null
                ? IconButton(
                    icon: Icon(
                      Icons.emoji_emotions_outlined,
                      size: 27,
                      color: ColorConstant.black900,
                    ),
                    onPressed: () {},
                  )
                : SizedBox.shrink(),
            widget.path != null
                ? IconButton(
                    icon: Icon(
                      Icons.title,
                      size: 27,
                      color: ColorConstant.black900,
                    ),
                    onPressed: () {},
                  )
                : SizedBox.shrink(),
            widget.path != null
                ? IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 27,
                      color: ColorConstant.black900,
                    ),
                    onPressed: () {},
                  )
                : SizedBox.shrink(),
          ]),

      // ignore: sized_box_for_whitespace
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: <Widget>[
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            child: _controller.value.isInitialized // initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          widget.path != null
              ? Positioned(
                  bottom: 0,
                  child: Container(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      child: TextFormField(
                          style: const TextStyle(
                            fontSize: 17,
                            // color:AppColors.textFaded,
                          ),
                          maxLines: 6,
                          minLines: 1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add Caption ......',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                  bottom: 8.0,
                                ),
                                child: Icon(
                                  Icons.add_photo_alternate,
                                  color: ColorConstant.gray5001,
                                  size: 25,
                                  // color
                                ),
                              ),
                              hintStyle: TextStyle(
                                fontSize: 19,
                                color: ColorConstant.gray5001,
                              ),
                              suffixIcon: CircleAvatar(
                                radius: 27,
                                backgroundColor: ColorConstant.gray5001,
                                child: Icon(
                                  Icons.check,
                                  color: ColorConstant.black900,
                                  size: 27,
                                ),
                              )))))
              : SizedBox.shrink(),

          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: CircleAvatar(
                radius: 38,
                backgroundColor: ColorConstant.whiteA700,
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: ColorConstant.black900,
                  size: 50,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  onTapArrowleft8() {
    Get.back();
  }
}
