import 'package:flutter/material.dart';
import './product_item.dart';
import '../models/product.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(
          10.0), //const для того чтобы не происходил ReBuild
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (context, index) => ProductItem(
        id: products[index].id,
        imageUrl: products[index].imageUrl,
        title: products[index].title,
      ),
    );
  }
}
