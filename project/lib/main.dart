import 'package:flutter/material.dart';
import './screens/orders_screen.dart';
import 'providers/orders.dart';
import './screens/cart_screen.dart';
import './screens/products_oveview_screen.dart';
import './screens/product_details_screen.dart';
import 'providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: //ProviderЫ которые предоставляет instance во все нижние классы, но обновляются только те которые "слушают" изменения provider в том числе и context
          [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.green),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
