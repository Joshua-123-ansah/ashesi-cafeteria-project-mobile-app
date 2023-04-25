

import 'package:application/presentation/widgets/singleitemview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants.dart';
import '../../core/utils/image_constant.dart';
import '../../model/food_model.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;

  const FoodCard({Key? key, required this.food}) : super(key: key);

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
                        image: NetworkImage(food.image!), fit: BoxFit.cover)),
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
                          food.foodName!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: food.cafeteriaName == "Akonor"
                                ? primaryColor
                                : Colors.green,
                            borderRadius: BorderRadius.circular(50)),
                        height: 24,
                        width: 60,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailedProductScreen(
                                  food: food,
                                ),
                              ),
                            );
                          },
                          child: Center(
                              child: Text(
                            "Order",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(food.extras!),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        food.cafeteriaName!,
                        style: TextStyle(
                            color: food.cafeteriaName == "Akonor"
                                ? primaryColor
                                : Colors.green,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Text(
                        "GH${food.price}.00",
                        style: TextStyle(
                            color: food.cafeteriaName == "Akonor"
                                ? primaryColor
                                : Colors.green,
                            fontWeight: FontWeight.w600),
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
