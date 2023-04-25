import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/math_utils.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String image;

  final Color color;
  final String cafeteriaNumber;

  const ContactCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.color,
      required this.cafeteriaNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.all(Radius.circular(35)),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 450,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 250,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(image),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF630511),
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Click on the button below to call the cafeteria",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                        FlutterPhoneDirectCaller.callNumber(
                            '${cafeteriaNumber}');
                      },
                      child: Text(
                        "Call",
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
