import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/notification_requests_screen/models/notification_requests_model.dart';/// A controller class for the NotificationRequestsScreen.
///
/// This class manages the state of the NotificationRequestsScreen, including the
/// current notificationRequestsModelObj
class NotificationRequestsController extends GetxController {Rx<NotificationRequestsModel> notificationRequestsModelObj = NotificationRequestsModel().obs;

 }
