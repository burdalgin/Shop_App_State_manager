import 'package:flutter/material.dart';
import './screens/products_oveview_screen.dart';
import './screens/product_details_screen.dart';
import 'providers/products_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          Products(), //Provider который предоставляет instance во все нижние классы, но обновляются только те которые "слушают" изменения provider в том числе и context

      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.green),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
