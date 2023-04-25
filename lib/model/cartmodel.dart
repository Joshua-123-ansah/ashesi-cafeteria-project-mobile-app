class CartModel {
  String? name;
  String? image;
  String? price;
  int quantity;
  String? cafeteriaName;

  CartModel(
      {this.name,
      this.image,
      this.price,
      required this.quantity,
      required this.cafeteriaName});
}
