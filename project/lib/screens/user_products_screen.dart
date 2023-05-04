import '../providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/user_product_item.dart';
import '../widgets/main_drawer.dart';
import './edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product-screen';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: const Text("Your Product"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName);
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: ((_, index) => Column(
                  children: [
                    UserProductItem(
                        title: productsData.items[index].title,
                        imageUrl: productsData.items[index].imageUrl),
                    Divider(),
                  ],
                )),
          ),
        ));
  }
}
