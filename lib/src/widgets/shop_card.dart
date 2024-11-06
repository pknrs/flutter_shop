import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/product.dart';
import 'package:transparent_image/transparent_image.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(product.title),
          duration: const Duration(milliseconds: 500),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.shadow,
        elevation: 4.0,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: product.image,
                    width: 100,
                    height: 115,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '₹ ${product.price}',
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            const Align(
              alignment: Alignment(0.9, -0.9),
              child: Icon(
                Icons.shopping_bag,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 25.0,
                    offset: Offset(0.0, 0.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
