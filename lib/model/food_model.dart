class FoodModel {
  String? cafeteriaName;
  String? extras;
  String? foodName;
  String? image;
  String? price;

  FoodModel(
      {this.cafeteriaName, this.extras, this.foodName, this.image, this.price});

  //Receive data from firebase
  factory FoodModel.forMap(map) {
    return FoodModel(
        cafeteriaName: map['cafeteria'],
        extras: map['extras'],
        foodName: map['foodname'],
        image: map['image'],
        price: map['price']);
  }
}
