import "package:flutter/material.dart";
import '../widgets/BeforeInfo.dart';
import '../widgets/MyButton.dart';
import "../widgets/MyTextFormField.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/SubInfo.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _SignUpState();
}

final TextEditingController _emailAddress = TextEditingController();
final TextEditingController _password = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
RegExp regExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

// firebase
final _auth = FirebaseAuth.instance;

class _SignUpState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8DFDF),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const BeforeInfo(
                  information: "Welcome to Cafeteria App",
                  type: "Sign in to continue"),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
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
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      name: "Email",
                    ),
                    MyTextFormField(
                      validate: (value) {
                        if (value == "") {
                          return "Please Enter a Password";
                        } else if (value != null && value.length < 8) {
                          return "Password is too short";
                        }

                        return null;
                      },
                      obscureText: true,
                      icon: Icons.vpn_key,
                      controller: _password,
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.visiblePassword,
                      name: "Password",
                    ),
                    MyButton(
                      paddingNumber: 0,
                      authType: () {
                        signIn(_emailAddress.text, _password.text);
                      },
                      name: "Sign In",
                    ),
                    SubInfo(
                      onPress: () {
                        Navigator.pushNamed(context, "/forgottenPassword");
                      },
                      information: "",
                      type: "Forgotten Password",
                    ),
                    SubInfo(
                      onPress: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      information: "Don't have an account?",
                      type: "Register",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.pushNamed(context, "/fingerprint"),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message, timeInSecForIosWeb: 1);
      });
    }
  }
}
