import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({
    this.id,
    this.title,
    this.description,
    this.author,
    this.image,
    this.quantity,
    this.price,
    this.userid,
    this.isExplore,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? author;
  final String? image;
  final int? quantity;
  final double? price;
  final int? userid;
  final bool? isExplore;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        author: json["author"] == null ? null : json["author"],
    image: json["image"] == null ? null : json["image"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        price: json["price"] == null ? null : json["price"],
        userid: json["userid"] == null ? null : json["userid"],
        isExplore: json["isExplore"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "author": author == null ? null : author,
        "image": image == null ? null : image,
        "quantity": quantity == null ? null : quantity,
        "price": price == null ? null : price,
        "userid": userid == null ? null : userid,
        "isExplore": isExplore,
      };
}
