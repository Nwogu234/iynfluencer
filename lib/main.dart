import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/data/general_controllers/notification_service.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/env.dart';
import 'package:iynfluencer/firebase_options.dart';
import 'core/app_export.dart';
import 'data/general_controllers/sockect_client.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

final storage = FlutterSecureStorage();

@pragma("vm:entry-point")
Future<void> _firebaseMessagingHandler(RemoteMessage remoteMessage) async {
  final message = remoteMessage.messageId;
  print("handling a background: $message");
}

// Initialize Flutter Local Notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  // Ensure Firebase is initialized only once
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'Iynfluencer',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('fcmToken: $fcmToken');

  final storage = FlutterSecureStorage();
  await storage.write(key: 'fcm_token', value: fcmToken);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    Get.put(UserController()); // Initialize FirstController
    Get.put(SocketClient());
    Get.put(NotificationService()).initialize();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // your design size
      builder: (context, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.cyan,
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.standard,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.cyan,
            backgroundColor: Colors.white,
          ).copyWith(
              secondary: Colors.cyan,
              onSecondary: Colors.white,
              background: Colors.white),
        ),
        translations: AppLocalization(),
        locale: Get.deviceLocale, //for setting localization strings
        fallbackLocale: Locale('en', 'US'),
        title: 'iynfluencer',
        initialBinding: InitialBindings(),
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages,
        home: widget,
      ),
    );
  }
}
