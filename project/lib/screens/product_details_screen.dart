import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  //const ProductDetailScreen({Key key}) : super(key: key);

  static const routeName = '/product-details-screen';

  @override
  Widget build(
      BuildContext
          context) //будет происходить Rebuild каждый раз как изменяется Provider
  {
    final String productId =
        ModalRoute.of(context).settings.arguments as String;
    final loadedProducts = Provider.of<Products>(context, listen: false).findById(
        productId); //findByID - это метод который описали в классе //listen = false не будет происхожить Rbuild когда изменятся данные
    return Scaffold(
      appBar: AppBar(title: Text(loadedProducts.title)),
    );
  }
}
