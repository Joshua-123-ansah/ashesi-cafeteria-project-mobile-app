import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/BeforeInfo.dart';
import '../widgets/MyButton.dart';
import "../widgets/MyTextFormField.dart";
import '../widgets/SubInfo.dart';
import 'login.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({Key? key}) : super(key: key);

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

final TextEditingController _emailAddress = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final _auth = FirebaseAuth.instance;

class _ForgottenPasswordState extends State<ForgottenPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const BeforeInfo(
                  information: "Forgotten Password",
                  type: "Pin sent to 024**********33",
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  height: 250,
                  // color: Colors.blue,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MyTextFormField(
                        validate: (value) {
                          if (value != null && value == "") {
                            return "Please Fill Email";
                          } else if (value != null && !regExp.hasMatch(value)) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                        obscureText: false,
                        icon: Icons.email_outlined,
                        controller: _emailAddress,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.emailAddress,
                        name: "Email",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MyButton(
                          paddingNumber: 0,
                          name: "Enter",
                          authType: () {
                            changePassword(_emailAddress.text);
                          },
                        ),
                      ),
                      SubInfo(
                        onPress: () {
                          Navigator.pop(context);
                        },
                        information: "Go back to ",
                        type: "Login Page",
                      )
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

  void changePassword(String email) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((uid) => {
                Fluttertoast.showToast(
                    msg:
                        "A mail has been sent to your email to reset your password"),
                Navigator.pop(context)
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message, timeInSecForIosWeb: 1);
      });
    }
  }
}
