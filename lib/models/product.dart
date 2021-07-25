class Product {
  Product({
    this.id,
    this.productName,
    this.price,
    this.quantity,
    this.stockInHand,
    this.userid,
  });

  final int? id;
  final String? productName;
  final int? price;
  final int? quantity;
  final int? stockInHand;
  final int? userid;

  Product copyWith({
    int? id,
    String? productName,
    int? price,
    int? quantity,
    int? stockInHand,
    int? userid,
  }) =>
      Product(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        stockInHand: stockInHand ?? this.stockInHand,
        userid: userid ?? this.userid,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : json["id"],
    productName: json["productName"] == null ? null : json["productName"],
    price: json["price"] == null ? null : json["price"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    stockInHand: json["stockInHand"] == null ? null : json["stockInHand"],
    userid: json["userid"] == null ? null : json["userid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "productName": productName == null ? null : productName,
    "price": price == null ? null : price,
    "quantity": quantity == null ? null : quantity,
    "stockInHand": stockInHand == null ? null : stockInHand,
    "userid": userid == null ? null : userid,
  };
}