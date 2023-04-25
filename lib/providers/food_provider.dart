
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/cartmodel.dart';
import '../model/food_model.dart';

class FoodProvider with ChangeNotifier {
  List<FoodModel> akonorFood = [];
  List<FoodModel> bigbenFood = [];
  List<FoodModel> allFood = [];
  List<CartModel> listOfCartItems = [];

  void getCartData(
      {required String name,
      required String image,
      required String price,
      required int quantity,
      required String cafeteriaName}) {
    listOfCartItems.add(
      CartModel(
          name: name,
          image: image,
          price: price,
          quantity: quantity,
          cafeteriaName: cafeteriaName),
    );
  }

  void clearCartData() {
    listOfCartItems.clear();
  }

  void deleteItemByName(String name) {
    listOfCartItems.remove(name);
  }

  void deleteFoodFromCart({required int index}) {
    listOfCartItems.removeAt(index);
    notifyListeners();
    // print(getCartItemList);
  }

  int totalPrice() {
    int totalAmount = 0;
    for (var element in listOfCartItems) {
      totalAmount += element.quantity * int.parse(element.price!);
    }
    return totalAmount;
  }

  List<CartModel> get getCartItemList {
    return listOfCartItems;
  }

  Future<List<FoodModel>> getAllProducts() async {
    allFood = [];
    FoodModel item;
    QuerySnapshot allFoodData =
        await FirebaseFirestore.instance.collection("allfood").get();

    for (var element in allFoodData.docs) {
      item = FoodModel(
          cafeteriaName: element['cafeteria'],
          extras: element['extras'],
          foodName: element['foodname'],
          image: element['image'],
          price: element['price']);
      allFood.add(item);
    }
    notifyListeners();
    return allFood;
  }

  Future<List<FoodModel>> getAkonorFood() async {
    akonorFood = [];
    FoodModel item;
    QuerySnapshot akonor = await FirebaseFirestore.instance
        .collection("allfood")
        .where("cafeteria", isEqualTo: "Akonor")
        .get();

    for (var element in akonor.docs) {
      item = FoodModel(
          cafeteriaName: element['cafeteria'],
          extras: element['extras'],
          foodName: element['foodname'],
          image: element['image'],
          price: element['price']);
      akonorFood.add(item);
    }
    notifyListeners();
    return akonorFood;
  }

  Future<List<FoodModel>> getBigBenFood() async {
    bigbenFood = [];
    FoodModel item;
    QuerySnapshot bigben = await FirebaseFirestore.instance
        .collection("allfood")
        .where("cafeteria", isEqualTo: "BigBen")
        .get();

    for (var element in bigben.docs) {
      item = FoodModel(
          cafeteriaName: element['cafeteria'],
          extras: element['extras'],
          foodName: element['foodname'],
          image: element['image'],
          price: element['price']);
      bigbenFood.add(item);
    }
    notifyListeners();
    return bigbenFood;
  }

  List<FoodModel> searchList(String query) {
    List<FoodModel> searchedList = allFood.where((element) {
      return element.foodName!.toUpperCase().contains(query) ||
          element.foodName!.toLowerCase().contains(query);
    }).toList();
    return searchedList;
  }
}
