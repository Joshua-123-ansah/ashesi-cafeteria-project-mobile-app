import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/math_utils.dart';
import '../../model/cartmodel.dart';

class CheckOutCard extends StatefulWidget {
  final CartModel foodInfo;
  int quantity;

  CheckOutCard({Key? key, required this.foodInfo, required this.quantity})
      : super(key: key);

  @override
  State<CheckOutCard> createState() => _CheckOutCartState();
}

class _CheckOutCartState extends State<CheckOutCard> {
  Widget _quantityDisplayButton() {
    return Container(
      alignment: Alignment.center,
      height: getVerticalSize(
        35.90,
      ),
      width: getHorizontalSize(
        120.00,
      ),
      decoration: BoxDecoration(
        color: ColorConstant.pink900,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            50.00,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "Quantity",
            style: TextStyle(
                color: kWhiteColor,
                fontSize: kNormalFontSize,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "${widget.quantity}",
            style: TextStyle(
                color: kWhiteColor,
                fontSize: kNormalFontSize,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60 / 2),
                    image: DecorationImage(
                        image: NetworkImage(widget.foodInfo.image!),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 131,
                        child: Text(
                          widget.foodInfo.name!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50)),
                        height: 24,
                        width: 90,
                        child: Center(
                            child: Text(
                          widget.foodInfo.cafeteriaName!,
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("GH${widget.foodInfo.price}.00"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _quantityDisplayButton(),
                      SizedBox(
                        width: 80,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
