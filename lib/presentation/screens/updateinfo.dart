
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../core/utils/color_constant.dart';
import '../../model/user_model.dart';
import '../../providers/user_provider.dart';
import '../widgets/BeforeInfo.dart';
import '../widgets/MyButton.dart';
import "../widgets/MyTextFormField.dart";
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/notificationbutton.dart';
import 'home.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

final TextEditingController _userName = TextEditingController();
final TextEditingController _phoneNumber = TextEditingController();
final TextEditingController _emailAddress = TextEditingController();
final GlobalKey<FormState> _updateKey = GlobalKey<FormState>();
String? email;
String? password;

RegExp regExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class _UpdateState extends State<Update> {
  final _auth = FirebaseAuth.instance;
  late UserModel currentUser;

  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  void getUser() async {
    currentUser = await context.read<UserProvider>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray300,
      appBar: AppBar(
        title: Text(
          "Update Information",
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: ColorConstant.gray300,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[NotificationButton()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _updateKey,
            child: Column(
              children: [
                const BeforeInfo(
                  information: "Update Information",
                  type: "Use form below to update info",
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 350,
                  // color: Colors.blue,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MyTextFormField(
                        validate: (value) {
                          if (value != null && value.length < 4) {
                            return "Username is Too Short";
                          } else if (value == "") {
                            return "Please Fill Username";
                          }
                          return null;
                        },
                        obscureText: false,
                        icon: Icons.account_circle_outlined,
                        controller: _userName,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.text,
                        name: "Username",
                      ),
                      MyTextFormField(
                        validate: (value) {
                          if (value != null && value == "") {
                            return "Please Fill Email";
                          } else if (value != null && !regExp.hasMatch(value)) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                        onSave: (value) {
                          _emailAddress.text = value!;
                        },
                        obscureText: false,
                        icon: Icons.email_outlined,
                        controller: _emailAddress,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.emailAddress,
                        name: "Email",
                      ),
                      MyTextFormField(
                        validate: (value) {
                          if ((value != null && value.length < 8) &&
                              (value.length > 18)) {
                            return "Student ID must be 8 numbers";
                          } else if (value == "") {
                            return "Please enter a studentID";
                          }
                          return null;
                        },
                        obscureText: false,
                        icon: Icons.phone,
                        controller: _phoneNumber,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.phone,
                        name: "Number",
                      ),
                      MyButton(
                        paddingNumber: 0,
                        authType: () {
                          updateInformation(_userName.text, _emailAddress.text,
                              int.parse(_phoneNumber.text));
                        },
                        name: "Update",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateInformation(String username, String email, int number) async {
    if (_updateKey.currentState!.validate()) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      await firebaseFirestore
          .collection("users")
          .doc(user!.uid)
          .update({"email": email, "username": username, "number": number});

      Fluttertoast.showToast(msg: "Information Successfully Updated :) ");
      Navigator.pop(context);
    }
  }
}
