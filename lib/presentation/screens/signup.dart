import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import '../../model/user_model.dart';
import '../widgets/BeforeInfo.dart';
import '../widgets/MyButton.dart';
import "../widgets/MyTextFormField.dart";
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/SubInfo.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final TextEditingController _userName = TextEditingController();
final TextEditingController _phoneNumber = TextEditingController();
final TextEditingController _emailAddress = TextEditingController();
final TextEditingController _password = TextEditingController();
final TextEditingController _passwordConfirm = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String? email;
String? password;

RegExp regExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const BeforeInfo(
                  information: "Let's Get Started",
                  type: "Create a new account",
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 500,
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
                          if ((value != null && value.length < 8) ||
                              (value!.length > 8)) {
                            return "Student ID must be 8";
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
                        name: "StudentID",
                      ),
                      MyTextFormField(
                        validate: (value) {
                          if (value != null && value.length < 8) {
                            return "Password is too short";
                          } else if (value == "") {
                            return "Please Enter a Password";
                          }
                          return null;
                        },
                        onSave: (value) {
                          _password.text = value!;
                        },
                        obscureText: true,
                        icon: Icons.vpn_key,
                        controller: _password,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.visiblePassword,
                        name: "Password",
                      ),
                      MyTextFormField(
                        validate: (value) {
                          if (_password.text != _passwordConfirm.text) {
                            return "Password does not match";
                          }
                          return null;
                        },
                        obscureText: true,
                        icon: Icons.vpn_key_outlined,
                        controller: _passwordConfirm,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.visiblePassword,
                        name: "Password Again",
                      ),
                      MyButton(
                        paddingNumber: 0,
                        authType: () {
                          // print("I am here");
                          signUp(_emailAddress.text, _password.text);
                        },
                        name: "Sign Up",
                      ),
                      SubInfo(
                        onPress: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        information: "have an account?",
                        type: "Login",
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFireStore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.uid = user!.uid;
    userModel.username = _userName.text;
    userModel.email = user.email;
    userModel.student_id = int.parse(_phoneNumber.text);
    userModel.student_bal = 100;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
    Navigator.pushNamed(context, "/login");
  }
}
