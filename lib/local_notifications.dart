import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Notifications {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  init() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation("America/Mexico_City"));
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("web_hi_res_512");
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    this.flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(String title) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      "your channel",
      "channel name",
      "channel description",
      priority: Priority.max,
      importance: Importance.max,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await this
        .flutterLocalNotificationsPlugin
        .show(0, title, "Aviso entrante", platformChannelSpecifics);
  }
}
