import 'package:flutter/material.dart';
import '../providers/product.dart';

import '../widgets/products_grid_view.dart';

class ProductsOverviewScreen extends StatelessWidget {
  // const ProductsIverviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Shop')),
      body: ProductsGridView(), //отдельный виджет с
    );
  }
}
