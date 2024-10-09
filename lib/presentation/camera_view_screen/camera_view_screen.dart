import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/models/media_file/media_file.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_image_view.dart';


class CameraViewScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const  CameraViewScreen({
   this.path,
   this.mediaFile,
   this.deliver
  //  required this.onImageSend,
    });

  final String? path;
  final String? deliver;
  final File? mediaFile;
 // final Function onImageSend;
  static TextEditingController _controller = TextEditingController();
 final String baseUrl = 'https://iynf-kong-ko4xr.ondigitalocean.app';

  @override
  Widget build(BuildContext context) {
     print('MediaFile: $mediaFile');
    if (mediaFile != null) {
      print('MediaFile Path: ${mediaFile!.path}');
      print('MediaFile Path: $baseUrl/${mediaFile!.path.split('/').last}');
    }
    
    return Scaffold(
      backgroundColor:Colors.black,
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
            actions:<Widget>[
              path != null ?
              IconButton(
                icon:Icon(
                  Icons.crop_rotate,
                  size:27,
                  color: ColorConstant.whiteA700,
                ),
                onPressed:(){},
              ) : SizedBox.shrink(),
                path != null ?
              IconButton(
                icon: Icon(
                  Icons.emoji_emotions_outlined,
                  size:27,
                  color: ColorConstant.whiteA700,
                ),
                onPressed:(){},
              ) : SizedBox.shrink(),
               path != null ?
              IconButton(
                icon:Icon(
                  Icons.title,
                  size:27,
                  color: ColorConstant.whiteA700,
                ),
                onPressed:(){},
              ) : SizedBox.shrink(),
               path != null ?
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size:27,
                  color: ColorConstant.whiteA700,
                ),
                onPressed:(){},
              ) : SizedBox.shrink(),
            ]
      
        ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children:<Widget>[
            // ignore: sized_box_for_whitespace
            Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            child: path != null ?   
             Image.file(
             File( path ?? ''),
              fit: BoxFit.cover,
            ) : deliver != null ?
            CustomImageView(
              url: deliver ?? '',
              fit: BoxFit.cover,
            ) : 
            Image.file(
               mediaFile!,
               fit: BoxFit.cover,
              )  
          
            ),
          path != null ?
            Positioned(
            bottom:0,
            child:Container(
            color:Colors.black,
            width:MediaQuery.of(context).size.width,
            padding:const EdgeInsets.symmetric(
              vertical:5,
              horizontal:8
            ),
            child:TextFormField(
              controller: _controller,
              style:const TextStyle(
                  fontSize:17,
                  color:Colors.white,
                ),
                maxLines: 6,
                minLines: 1,
              decoration: InputDecoration(
                border:InputBorder.none,
                hintText:'Add Caption ......',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    bottom:8.0,
                  ),
                  child: Icon(
                    Icons.add_photo_alternate,
                    color:ColorConstant.gray5001,
                    size:25,
                    // color
                  ),
                ),
                hintStyle:TextStyle(
                  fontSize:19,
                  color: ColorConstant.gray5001,
                  // color
                ),
                suffixIcon: InkWell(
                  onTap: (){
                  },
                  child:  CircleAvatar(
                    radius: 27,
                    backgroundColor: ColorConstant.whiteA700,
                    child: Icon(
                      Icons.check,
                      color: ColorConstant.black900,
                      size: 27,
                    ),
                  ),
                )
              )
            )
            )
            ) : SizedBox.shrink()
          ]
        ),
      ),
    );
  }

  onTapArrowleft8() {
    Get.back();
  }
}