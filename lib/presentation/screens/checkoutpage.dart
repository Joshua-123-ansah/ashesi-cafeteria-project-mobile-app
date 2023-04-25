
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../core/utils/color_constant.dart';
import '../../providers/food_provider.dart';
import '../../providers/user_provider.dart';
import '../widgets/checkoutcard.dart';
import '../widgets/customappbar.dart';
import 'home.dart';

class CheckOutPage extends StatefulWidget {
  CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  Widget _buildButtomDetails(
      {required String startName, required String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName,
          style: TextStyle(fontSize: kMediumFontSize),
        ),
        Text(
          endName,
          style: TextStyle(fontSize: kMediumFontSize),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(
            title: "CheckOut Page",
          ),
        ),
        bottomNavigationBar: Container(
          height: 45,
          width: 50,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: const Text(
                        "Choose Option",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                int totalprice =
                                    context.read<FoodProvider>().totalPrice();
                                int? currentAmount = context
                                    .read<UserProvider>()
                                    .getUserInfo
                                    .student_bal;

                                if (totalprice > currentAmount!) {
                                  Fluttertoast.showToast(
                                      msg: "You have excited your balance");
                                  Navigator.pop(context);
                                } else {
                                  int balance = currentAmount - totalprice;
                                  updateUserBalance(amountLeft: balance);
                                  Fluttertoast.showToast(
                                      msg:
                                          "Thank you. Current balance is: $balance");
                                  Navigator.pop(context);
                                  context.read<FoodProvider>().clearCartData();
                                }
                              },
                              splashColor: Colors.transparent,
                              child: Row(
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.credit_card,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Text(
                                    "Pay with school ID",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff555555),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // getImage(ImageSource.gallery);
                              },
                              splashColor: Colors.transparent,
                              child: Row(
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.credit_card,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Text(
                                    "Pay with bank details",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff555555),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Text("Buy"),
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ),
        body: Container(
          color: ColorConstant.gray300,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "CheckOut",
                      style: TextStyle(
                          fontSize: kBigFontSize, color: primaryColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount:
                        context.read<FoodProvider>().listOfCartItems.length,
                    itemBuilder: (context, index) {
                      return CheckOutCard(
                        foodInfo:
                            context.read<FoodProvider>().listOfCartItems[index],
                        quantity: context
                            .read<FoodProvider>()
                            .listOfCartItems[index]
                            .quantity,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _buildButtomDetails(
                              startName: "Your Price",
                              endName:
                                  "GH${context.read<FoodProvider>().totalPrice()}.00"),
                          _buildButtomDetails(
                              startName: "Discount", endName: "GH0.00"),
                          _buildButtomDetails(
                              startName: "Total Price",
                              endName:
                                  "GH${context.read<FoodProvider>().totalPrice()}.00")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateUserBalance({required int amountLeft}) async {
    final _auth = FirebaseAuth.instance;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    await firebaseFirestore
        .collection("users")
        .doc(user!.uid)
        .update({"student_bal": amountLeft});

    Fluttertoast.showToast(msg: "Thank you very much for using our services ");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
