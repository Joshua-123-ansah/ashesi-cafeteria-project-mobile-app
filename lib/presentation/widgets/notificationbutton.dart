
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/notification_model.dart';
import '../../providers/notification_provider.dart';
import '../screens/notificationscreen.dart';

class NotificationButton extends StatefulWidget {
  NotificationButton({Key? key}) : super(key: key);

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  late List<NotificationModel> allNotifications = [];
  // @override
  void initState() {
    getAllNotification();
    super.initState();
  }

  void getAllNotification() async {
    allNotifications =
        await context.read<NotificationProvider>().getAllNotificationData();

    setState(() {
      allNotifications = allNotifications;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: const BadgePosition(top: 5, end: 8),
      badgeContent: Text(
        allNotifications.length.toString(),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.notifications_none,
          color: Color(0xFF630511),
        ),
        color: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NotificationScreen(allnotifications: allNotifications)),
          );
        },
      ),
    );
  }
}
