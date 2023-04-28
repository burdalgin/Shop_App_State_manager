import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProducts.imageUrl,
                fit: BoxFit.cover,
                // alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(height: 10),
            Text('\$${loadedProducts.price}'),
            SizedBox(height: 10),
            Text(
              '${loadedProducts.description}',
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
