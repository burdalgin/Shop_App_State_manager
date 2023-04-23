import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/dummy_products.dart';
import '../widgets/product_item.dart';

class ProductsIverviewScreen extends StatelessWidget {
  // const ProductsIverviewScreen({Key key}) : super(key: key);

  final List<Product> loadedProducts = dummyProductsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Shop')),
        body: GridView.builder(
          padding: const EdgeInsets.all(
              10.0), //const для того чтобы не происходил ReBuild
          itemCount: loadedProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemBuilder: (context, index) => ProductItem(
            id: loadedProducts[index].id,
            imageUrl: loadedProducts[index].imageUrl,
            title: loadedProducts[index].title,
          ),
        ));
  }
}
