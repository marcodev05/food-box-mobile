class Cart {
  int? cartId;
  late String name;
  late double price;
  String? picture;
  late int quantity;

  Cart({
    this.cartId,
    required this.name,
    required this.price,
    this.picture,
    required this.quantity,
  });


  Cart.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cartId'] = cartId;
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] =price;
    data['picture'] = picture;
    return data;
  }
  
}
