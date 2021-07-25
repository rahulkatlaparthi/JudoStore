import 'dart:convert';

import 'product.dart';

ProductsResponse productsResponseFromJson(String str) =>
    ProductsResponse.fromJson(json.decode(str));

class ProductsResponse {
  ProductsResponse({
    this.products,
  });

  final List<Product>? products;

  ProductsResponse copyWith({
    List<Product>? products,
  }) =>
      ProductsResponse(
        products: products ?? this.products,
      );

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );
}
