
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/utils/color_constant.dart';
import '../../model/food_model.dart';
import '../widgets/foodcard.dart';
import '../widgets/notificationbutton.dart';

class Akonor extends StatefulWidget {
  final String cafeteriaName;
  final List<FoodModel> foodList;
  final Color color;
  const Akonor(
      {Key? key,
      required this.cafeteriaName,
      required this.foodList,
      required this.color})
      : super(key: key);

  @override
  State<Akonor> createState() => _AkonorState();
}

class _AkonorState extends State<Akonor> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> documents = FirebaseFirestore.instance
        .collection("allfood")
        .where("cafeteria", isEqualTo: widget.cafeteriaName)
        .snapshots();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.cafeteriaName,
            style: TextStyle(color: Colors.black),
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
        body: StreamBuilder<QuerySnapshot>(
            stream: documents,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text("error");
              }
              return Container(
                color: ColorConstant.gray300,
                child: ListView.builder(
                  itemCount: snapshot.data?.size,
                  itemBuilder: (context, index) {
                    var data =
                        snapshot.data?.docs.elementAt(index).data() as Map;
                    FoodModel food = FoodModel(
                        cafeteriaName: data['cafeteria'],
                        extras: data['extras'],
                        foodName: data['foodname'],
                        image: data['image'],
                        price: data['price']);

                    return FoodCard(food: food);
                  },
                ),
              );
            }));
  }
}
