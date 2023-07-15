import 'controller/creator_hireslist_tab_container_controller.dart';
import 'models/creator_hireslist_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/creator_hireslist_page/creator_hireslist_page.dart';
import 'package:iynfluencer/presentation/creator_jobslist_page/creator_jobslist_page.dart';

class CreatorHireslistTabContainerPage extends StatelessWidget {
  CreatorHireslistTabContainerPage({Key? key})
      : super(
          key: key,
        );

  CreatorHireslistTabContainerController controller = Get.put(
      CreatorHireslistTabContainerController(
          CreatorHireslistTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA700,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: getVerticalSize(
                    60,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    border: Border(
                      bottom: BorderSide(
                        color: ColorConstant.indigo50,
                        width: getHorizontalSize(
                          1,
                        ),
                      ),
                    ),
                  ),
                  child: TabBar(
                    controller: controller.tabiewController,
                    labelColor: ColorConstant.cyan300,
                    labelStyle: TextStyle(
                      fontSize: getFontSize(
                        14.5,
                      ),
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w300,
                    ),
                    unselectedLabelColor: ColorConstant.gray500,
                    unselectedLabelStyle: TextStyle(
                      fontSize: getFontSize(
                        14.5,
                      ),
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w300,
                    ),
                    indicatorColor: ColorConstant.cyan300,
                    tabs: [
                      Tab(
                        child: Text(
                          "lbl_my_posting".tr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "lbl_hires2".tr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(
                    620,
                  ),
                  child: TabBarView(
                    controller: controller.tabiewController,
                    children: [
                      CreatorJobslistPage(),
                      CreatorHireslistPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
