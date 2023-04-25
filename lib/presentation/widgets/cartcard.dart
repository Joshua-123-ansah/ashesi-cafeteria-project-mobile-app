
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/math_utils.dart';
import '../../model/cartmodel.dart';
import '../../providers/food_provider.dart';

class CartCard extends StatefulWidget {
  // final Color color;
  final CartModel foodInfo;
  final int index;
  int quantity;
  bool deleted = false;

  CartCard(
      {Key? key,
      required this.foodInfo,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  Widget _toggleQuantityButton() {
    return Container(
      alignment: Alignment.center,
      height: getVerticalSize(
        35.90,
      ),
      width: getHorizontalSize(
        100.00,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.remove,
              color: kWhiteColor,
            ),
            onTap: () {
              setState(() {
                widget.quantity--;
                if (widget.quantity <= 1) {
                  widget.quantity = 1;
                }
              });
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "${widget.quantity}",
            style: TextStyle(
                color: kWhiteColor,
                fontSize: kNormalFontSize,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Icon(
              Icons.add,
              color: kWhiteColor,
            ),
            onTap: () {
              setState(() {
                widget.quantity++;
              });
            },
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.delete),
          // )
        ],
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    // TODO:
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
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
                        width: 150,
                        child: Text(
                          widget.foodInfo.name!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                      _toggleQuantityButton(),
                      SizedBox(
                        width: 116,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: () {
                            context
                                .read<FoodProvider>()
                                .deleteFoodFromCart(index: widget.index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Color(0xFF630511),
                          ),
                        ),
                      )
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
