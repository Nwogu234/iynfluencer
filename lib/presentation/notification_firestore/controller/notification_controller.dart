import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/notification/notification_model';
import 'package:iynfluencer/presentation/notification_page_client_screen/models/notification_page_client_model.dart';

/// A controller class for the NotificationPageClientScreen.
///
/// This class manages the state of the NotificationPageClientScreen, including the
/// current notificationPageClientModelObj
///
class NotificationController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  var error = ''.obs;
  var token;
  final storage = FlutterSecureStorage();
  final ApiClient apiClient = ApiClient();
  final UserController user = Get.find();
  RxList<MNotification> notifications = <MNotification>[].obs;

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
  }

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  String? capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  getUser() async {
    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        fetchAllNotification().then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  Future<void> fetchAllNotification() async {
    try {
      error.value = '';
      isLoading.value = true;
      token = await storage.read(key: "token");

      final Response response = await apiClient.fetchNotification(token);
      if (response.isOk) {
        final responseData = response.body;
        final List<dynamic>? notificationList =
            responseData['paginatedNotifications']?['docs'];

        if (notificationList != null) {
          final userFullName =
              "${capitalizeFirstLetter(user.userModelObj.value.firstName)} ${capitalizeFirstLetter(user.userModelObj.value.lastName)}";
          notifications.value = notificationList
            .map((notification) => MNotification.fromJson(notification))
            .where((notification) => notification.title != userFullName)
            .toList();

          print('Notification list: $notifications');
        } else {
          notifications.clear();
          print('No notifications found');
        }
      } else {
        print('Failed to fetch messages: ${response.statusText}');
      }
    } catch (e) {
      print('Error fetching messages: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
