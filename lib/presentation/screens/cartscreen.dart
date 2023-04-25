
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../core/utils/color_constant.dart';
import '../../model/cartmodel.dart';
import '../../providers/food_provider.dart';
import '../widgets/cartcard.dart';
import '../widgets/customappbar.dart';
import 'checkoutpage.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // Stream<List<CartModel>> documents =
    //     context.read<FoodProvider>().listOfCartItems as Stream<List<CartModel>>;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 45,
          width: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckOutPage()));
            },
            child: Text("CheckOut"),
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(
            title: "Cart Page",
          ),
        ),
        body: Container(
          color: ColorConstant.gray300,
          child: ListView.builder(
            itemCount: context.watch<FoodProvider>().listOfCartItems.length,
            itemBuilder: (context, index) {
              return CartCard(
                foodInfo: context.watch<FoodProvider>().listOfCartItems[index],
                index: index,
                quantity: context
                    .read<FoodProvider>()
                    .listOfCartItems[index]
                    .quantity,
              );
            },
          ),
        ),
      ),
    );
  }
}
