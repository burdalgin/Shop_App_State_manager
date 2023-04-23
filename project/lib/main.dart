import 'package:flutter/material.dart';
import './screens/products_oveview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductsIverviewScreen(),
    );
  }
}
