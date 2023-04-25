
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/math_utils.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray300,
        body: Container(
          decoration: BoxDecoration(
            color: ColorConstant.gray300,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                72.00,
                              ),
                              top: getVerticalSize(
                                17.00,
                              ),
                              right: getHorizontalSize(
                                30.04,
                              ),
                            ),
                            child: Text(
                              "Ashesi Caferias Menu Portal",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.pink900,
                                fontSize: getFontSize(
                                  25,
                                ),
                                fontFamily: 'Playfair Display',
                                fontWeight: FontWeight.w700,
                                height: 1.76,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: getHorizontalSize(
                              293.02,
                            ),
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                59.98,
                              ),
                              top: getVerticalSize(
                                167.57,
                              ),
                              right: getHorizontalSize(
                                59.98,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.red5090,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  146.51,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getSize(
                                    239.59,
                                  ),
                                  width: getSize(
                                    239.59,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      26.71,
                                    ),
                                    top: getVerticalSize(
                                      26.72,
                                    ),
                                    right: getHorizontalSize(
                                      26.71,
                                    ),
                                    bottom: getVerticalSize(
                                      26.71,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.red50,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        119.80,
                                      ),
                                    ),
                                  ),
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.red50,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          119.80,
                                        ),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                6.68,
                                              ),
                                              top: getVerticalSize(
                                                10.00,
                                              ),
                                              right: getHorizontalSize(
                                                6.68,
                                              ),
                                              bottom: getVerticalSize(
                                                0.84,
                                              ),
                                            ),
                                            child: Image.asset(
                                              ImageConstant.imgImg12931,
                                              height: getSize(
                                                226.23,
                                              ),
                                              width: getSize(
                                                226.23,
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                176.85,
                              ),
                              top: getVerticalSize(
                                55.00,
                              ),
                              right: getHorizontalSize(
                                176.85,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                10.15,
                              ),
                              width: getHorizontalSize(
                                58.15,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.imgGroup22,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: getHorizontalSize(
                              405.91,
                            ),
                            margin: EdgeInsets.only(
                              left: getHorizontalSize(
                                35.00,
                              ),
                              top: getVerticalSize(
                                67.63,
                              ),
                              right: getHorizontalSize(
                                3.09,
                              ),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Hello there, welcome to the Ashesi Meal Portal. Click on the button below to see the menus available at the various cafeteria. \n',
                                    style: TextStyle(
                                      color: ColorConstant.bluegray900,
                                      fontSize: getFontSize(
                                        17.76,
                                      ),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'THANK YOU',
                                    style: TextStyle(
                                      color: ColorConstant.bluegray900,
                                      fontSize: getFontSize(
                                        17.76,
                                      ),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                43.00,
                              ),
                              top: getVerticalSize(
                                65.92,
                              ),
                              right: getHorizontalSize(
                                43.00,
                              ),
                              bottom: getVerticalSize(
                                20.00,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              height: getVerticalSize(
                                53.90,
                              ),
                              width: getHorizontalSize(
                                315.00,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.pink900,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    50.00,
                                  ),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                child: Text(
                                  "Explore",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: ColorConstant.whiteA700,
                                    fontSize: getFontSize(
                                      18,
                                    ),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
