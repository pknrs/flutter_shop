import 'dart:async';
import 'dart:convert';

import 'package:flutter_shop/src/models/product.dart';
import 'package:http/http.dart' as http;

Future<Product> fetchProduct(int id) async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));

  if (response.statusCode == 200) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load product');
  }
}
