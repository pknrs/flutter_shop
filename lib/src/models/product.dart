import 'package:flutter_shop/src/models/rating.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
        'price': num price,
        'description': String description,
        'category': String category,
        'image': String image,
        'rating': Map<String, dynamic> rating,
      } =>
        Product(
          id: id,
          title: title,
          price: price.toDouble(),
          description: description,
          category: category,
          image: image,
          rating: Rating.fromJson(rating),
        ),
      _ => throw const FormatException('Failed to load product.'),
    };
  }
}
