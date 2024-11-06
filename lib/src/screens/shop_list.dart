import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/product.dart';
import 'package:flutter_shop/src/services/fetch_products.dart';
import 'package:flutter_shop/src/widgets/shop_card.dart';

class ShopListView extends StatefulWidget {
  const ShopListView({super.key, required this.title});

  final String title;

  @override
  State<ShopListView> createState() => _ShopListViewState();
}

class _ShopListViewState extends State<ShopListView> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<Product>>(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return ShopCard(product: product);
                },
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
