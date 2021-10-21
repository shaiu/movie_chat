import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future initialize() async {
  //Initialization Settings for Android
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher_foreground');

  //Initialization Settings for iOS
  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();

  //InitializationSettings for initializing settings for both platforms (Android & iOS)
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}

// Future selectNotification(String payload) async {
//   return true;
// }

const NotificationDetails notificationDetails = NotificationDetails(
  android: AndroidNotificationDetails(
    'movie_chat_channel',
    'MovieChatChannel',
  ),
  iOS: IOSNotificationDetails(),
);

Future showNotification({
  int id = 0,
  String? title,
  String? body,
  String? payload,
}) async =>
    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
