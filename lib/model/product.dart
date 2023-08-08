import 'dart:convert';

class Product {
  final String size;
  final String description;
  final String price;
  final String imageUrl;
  final String id;
  final String track;

  Product(
      {required this.size,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.id,
      required this.track});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'size': size});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'_id': id});
    result.addAll({'track': track});

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      size: map['size'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      id: map['_id'] ?? '',
      track: map['track'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
