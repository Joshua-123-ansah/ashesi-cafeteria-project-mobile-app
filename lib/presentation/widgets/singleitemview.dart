
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/math_utils.dart';
import '../../model/food_model.dart';
import '../../providers/food_provider.dart';
import '../screens/cartscreen.dart';
import '../screens/home.dart';

class DetailedProductScreen extends StatefulWidget {
  final FoodModel food;
  bool state = false;
  int quantity = 1;

  DetailedProductScreen({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailedProductScreen> createState() => _DetailedProductScreenState();
}

class _DetailedProductScreenState extends State<DetailedProductScreen> {
  @override
  Widget build(BuildContext context) {
    // APPBAR
    AppBar _myAppBar() {
      return AppBar(
        title: const Text(
          "Detailed Food Page",
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ColorConstant.gray300,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    }

    Widget _pageImage() {
      return Center(
        child: Container(
          child: Card(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(widget.food.image!),
              )),
            ),
          ),
        ),
      );
    }

    Widget _cartButton() {
      return Container(
        alignment: Alignment.center,
        height: getVerticalSize(
          53.90,
        ),
        width: getHorizontalSize(
          150.00,
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
            context
                .read<FoodProvider>()
                .deleteItemByName(widget.food.foodName!);
            context.read<FoodProvider>().getCartData(
                name: widget.food.foodName!,
                image: widget.food.image!,
                price: widget.food.price!,
                quantity: widget.quantity,
                cafeteriaName: widget.food.cafeteriaName!);

            Fluttertoast.showToast(msg: "Food successfully added to cart");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
          child: Text(
            "Add to Cart",
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
      );
    }

    Widget _toggleQuantityButton() {
      return Container(
        alignment: Alignment.center,
        height: getVerticalSize(
          53.90,
        ),
        width: getHorizontalSize(
          150.00,
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
            )
          ],
        ),
      );
    }

    Widget _productInfo() {
      return Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
              width: double.infinity,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.food.foodName!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "GH${widget.food.price!}.00",
                          style: const TextStyle(
                              fontSize: 23, color: primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: Wrap(
                children: const <Widget>[
                  Text(
                    "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: _myAppBar(),
      backgroundColor: ColorConstant.gray300,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                _pageImage(),
                const SizedBox(
                  height: 10,
                ),
                _productInfo(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _toggleQuantityButton(),
                    _cartButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
