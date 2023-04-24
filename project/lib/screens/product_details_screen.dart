import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailScreen extends StatelessWidget {
  //const ProductDetailScreen({Key key}) : super(key: key);

  static const routeName = '/product-details-screen';

  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
    );
  }
}
