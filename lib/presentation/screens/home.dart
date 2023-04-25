
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/math_utils.dart';
import '../../model/food_model.dart';
import '../../model/user_model.dart';
import '../../providers/food_provider.dart';
import '../../providers/user_provider.dart';
import '../widgets/card.dart';
import '../widgets/notificationbutton.dart';
import '../widgets/search.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool homeColor = true;

  bool cartColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;

  bool logOut = false;

  List<FoodModel> akonorFood = [];
  List<FoodModel> bigbenFood = [];
  List<FoodModel> allFood = [];
  late UserModel currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    getUser();
    getAllFood();
    getAkonorFood();
    getBigBenFood();
    super.initState();
  }

  void getUser() async {
    currentUser = await context.read<UserProvider>().getUser();
  }

  void getAllFood() async {
    allFood = await context.read<FoodProvider>().getAllProducts();
    setState(() {
      allFood = allFood;
    });
  }

  void getAkonorFood() async {
    akonorFood = await context.read<FoodProvider>().getAkonorFood();
    setState(() {
      akonorFood = akonorFood;
    });
  }

  void getBigBenFood() async {
    bigbenFood = await context.read<FoodProvider>().getBigBenFood();
    setState(() {
      bigbenFood = bigbenFood;
    });
  }

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  @override
  AppBar _myAppBar() {
    return AppBar(
      title: const Text(
        "Ashesi Cafeteria",
        style: TextStyle(color: Color(0xFF630511)),
      ),
      centerTitle: true,
      elevation: 0.1,
      backgroundColor: ColorConstant.gray300,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Color(0xFF630511),
        ),
        onPressed: () {
          _key.currentState?.openDrawer();
        },
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: Search());
          },
          icon: const Icon(
            Icons.search,
            color: Color(0xFF630511),
          ),
        ),
        NotificationButton()
      ],
    );
  }

  Widget _myDrawer() {
    return Drawer(
      backgroundColor: ColorConstant.gray300,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFFe8dede)),
            accountName: Text(
              context.watch<UserProvider>().getUserInfo.username!,
              style: const TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              context.watch<UserProvider>().getUserInfo.email!,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            tileColor: homeColor ? Colors.white : null,
            onTap: () {
              setState(() {
                homeColor = true;
                cartColor = false;
                aboutColor = false;
                contactUsColor = false;
                logOut = false;
              });
              Navigator.pop(context);
            },
            leading: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          ListTile(
            tileColor: aboutColor ? Colors.white : null,
            onTap: () {
              setState(
                () {
                  aboutColor = true;
                  homeColor = false;
                  cartColor = false;
                  contactUsColor = false;
                  logOut = false;
                },
              );
              Navigator.pushNamed(context, "/profile");
            },
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text("About"),
          ),
          ListTile(
            tileColor: contactUsColor ? Colors.white : null,
            onTap: () {
              setState(() {
                contactUsColor = true;
                homeColor = false;
                cartColor = false;
                aboutColor = false;
                logOut = false;
              });
              Navigator.pushNamed(context, "/contactus");
            },
            leading: const Icon(Icons.phone),
            title: const Text("Contact"),
          ),
          ListTile(
            tileColor: cartColor ? Colors.white : null,
            onTap: () {
              setState(() {
                cartColor = true;
                homeColor = false;
                aboutColor = false;
                contactUsColor = false;
                logOut = false;
              });

              Navigator.pushNamed(context, "/update");
            },
            leading: const Icon(Icons.update_outlined),
            title: const Text("Update Info"),
          ),
          ListTile(
            tileColor: logOut ? Colors.white : null,
            onTap: () async {
              setState(() {
                logOut = true;
                homeColor = false;
                cartColor = false;
                aboutColor = false;
                contactUsColor = false;
              });
              await _signOut();
              Navigator.pushNamed(context, "/login");
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: _myDrawer(),
        appBar: _myAppBar(),
        backgroundColor: ColorConstant.gray300,
        body: Container(
          decoration: BoxDecoration(
            color: ColorConstant.gray300,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                26.69,
                              ),
                              top: getVerticalSize(
                                36.90,
                              ),
                              right: getHorizontalSize(
                                26.69,
                              ),
                            ),
                            child: Text(
                              "Welcome to the Ashesi Menu Portal ",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorConstant.pink900,
                                fontSize: getFontSize(
                                  20,
                                ),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: getHorizontalSize(
                            451.51,
                          ),
                          margin: EdgeInsets.only(
                            left: getHorizontalSize(
                              26.69,
                            ),
                            top: getVerticalSize(
                              19.14,
                            ),
                            right: getHorizontalSize(
                              26.69,
                            ),
                          ),
                          child: Text(
                            "Note: This portal will be managed by both students and personels from the various cafeterias ",
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstant.bluegray900,
                              fontSize: getFontSize(
                                17.76,
                              ),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                26.69,
                              ),
                              top: getVerticalSize(
                                43.72,
                              ),
                              right: getHorizontalSize(
                                24.47,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                MyCard(
                                  name: "Akonor",
                                  image: ImageConstant.akonor,
                                  foodList: akonorFood,
                                  color: Color(0xFF630511),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                MyCard(
                                  name: "BigBen",
                                  image: ImageConstant.bigben,
                                  foodList: bigbenFood,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          color: Color(0xFF630511),
                          child: Center(
                              child: Text(
                            "Owned by Ashesi University",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
