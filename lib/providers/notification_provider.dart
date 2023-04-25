import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/notification_model.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationModel> allNotifications = [];

  // Future getFirebaseInfo({required String collectionName}) async {
  //   QuerySnapshot allNotification =
  //       await FirebaseFirestore.instance.collection(collectionName).get();
  //   return allNotification;
  // }

  Future<List<NotificationModel>> getAllNotificationData() async {
    allNotifications = [];
    NotificationModel item;
    QuerySnapshot notifications =
        await FirebaseFirestore.instance.collection("notifications").get();

    for (var element in notifications.docs) {
      item = NotificationModel(
        title: element['title'],
        image: element['image'],
        description: element['description'],
      );
      // print(item);
      allNotifications.add(item);
    }
    notifyListeners();
    return allNotifications;
  }
}
