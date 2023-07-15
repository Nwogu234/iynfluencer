import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/post_page_screen/models/post_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PostPageScreen.
///
/// This class manages the state of the PostPageScreen, including the
/// current postPageModelObj
class PostPageController extends GetxController {PostPageController(this.postPageModelObj);
  TextEditingController inputController = TextEditingController();

  TextEditingController frametwelveController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController priceoneController = TextEditingController();

  TextEditingController frametwelveoneController = TextEditingController();

  TextEditingController frametwelvetwoController = TextEditingController();

  Rx<PostPageModel> postPageModelObj = PostPageModel().obs;

  @override
  void onClose() {
    super.onClose();
    inputController.dispose();
    frametwelveController.dispose();
    priceController.dispose();
    priceoneController.dispose();
    frametwelveoneController.dispose();
    frametwelvetwoController.dispose();
  }
}
