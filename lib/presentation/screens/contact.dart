
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/math_utils.dart';
import '../widgets/ContactCard.dart';
import '../widgets/notificationbutton.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Ashesi University",
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
                            "Note: You can make to the cafeteria if you do not receive an order ",
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
                                ContactCard(
                                  name: "Akonor Cafeteria",
                                  image: ImageConstant.akonor,
                                  color: Color(0xFF630511),
                                  cafeteriaNumber: "0240235033",
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ContactCard(
                                  name: "Big Ben Cafeteria",
                                  image: ImageConstant.bigben,
                                  color: Colors.green,
                                  cafeteriaNumber: '0240235033',
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
