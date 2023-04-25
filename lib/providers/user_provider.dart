import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  late UserModel user = UserModel(
      uid: "", username: "", email: "", student_id: 0, student_bal: 0);

  Future<UserModel> getUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot usersSnapShot = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.uid)
          .get();
      var element = usersSnapShot.data() as Map;

      user = UserModel(
          uid: element['uid'],
          username: element['username'],
          email: element['email'],
          student_id: element['student_id'],
          student_bal: element['student_bal']);
      notifyListeners();
    }
    return user;
  }

  UserModel get getUserInfo => user;
}
