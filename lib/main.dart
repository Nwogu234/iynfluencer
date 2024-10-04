import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iynfluencer/data/general_controllers/notification_service.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/env.dart';
import 'package:iynfluencer/firebase_options.dart';
import 'package:iynfluencer/presentation/messages_page/controller/messages_controller.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/controller/messages_page_influencer_controller.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'core/app_export.dart';
import 'data/general_controllers/sockect_client.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sizer/sizer.dart';
import 'package:hive/hive.dart';

final storage = FlutterSecureStorage();
bool _isHiveInitialized = false;

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

Future<void> configOneSignal() async {
  OneSignal.Debug.setLogLevel(OSLogLevel.debug);

  OneSignal.initialize(appId);
  OneSignal.Notifications.requestPermission(true).then((value) {
    print('signal value: $value');
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!_isHiveInitialized) {
    await Hive.initFlutter();
    Hive.registerAdapter(ChatDataAdapter());
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(MessageAdapter());
    _isHiveInitialized = true;
  }

  // await Hive.deleteBoxFromDisk('chats');

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
  await storage.write(key: 'fcmToken', value: fcmToken.toString());

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  await configOneSignal();

   SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
    SystemUiOverlay.top, 
  ]);



  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

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
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, widget) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                return GetMaterialApp(
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
                      background: Colors.white,
                    ),
                  ),
                  translations: AppLocalization(),
                  locale: Get.deviceLocale, // For setting localization strings
                  fallbackLocale: Locale('en', 'US'),
                  title: 'iynfluencer',
                  initialBinding: InitialBindings(),
                  initialRoute: AppRoutes.initialRoute,
                  getPages: AppRoutes.pages,
                  home: widget,
                );
              },
            );
          },
        );
      },
    );
  }
}
