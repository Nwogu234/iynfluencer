import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/presentation/community_page/models/body_item_model.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_page/controller/influencer_profile_comm_post_controller.dart';
import 'package:iynfluencer/presentation/influencer_profile_community_page/controller/influencer_profile_community_controller.dart';
import 'package:iynfluencer/presentation/influencer_profile_community_page/model/influencer_profile_community_model.dart';
import 'package:iynfluencer/presentation/influencer_profile_community_page/widget/community_item_widget.dart';
import 'package:iynfluencer/theme/app_decoration.dart';

class InfluencerProfileCommunityPage extends StatelessWidget {
   InfluencerProfileCommunityPage({Key? key}) : super(key: key);

   InfluencerProfileCommunityController controller =
      Get.put(InfluencerProfileCommunityController(InfluencerProfileCommunityModel().obs));


  @override
  Widget build(BuildContext context) {
    
     return SafeArea(
      child: Scaffold(
        backgroundColor:  ColorConstant.whiteA700,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: getPadding(
                    left: 16,
                    top: 19,
                    right: 16,
                  ),
                  child: Obx(
                    () => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return SizedBox(
                          height: getVerticalSize(
                            22,
                          ),
                        );
                      },
                      itemCount: controller
                          .influencerProfileCommunityModelObj.value.bodyItemList.value.length,
                      itemBuilder: (context, index) {
                        BodyItemModel model = controller
                            .influencerProfileCommunityModelObj.value.bodyItemList.value[index];
                        return CommunityItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}