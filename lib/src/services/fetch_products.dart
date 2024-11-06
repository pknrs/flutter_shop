import 'dart:async';
import 'dart:convert';

import 'package:flutter_shop/src/models/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List<dynamic>)
        .map((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Failed to load products');
  }
}
