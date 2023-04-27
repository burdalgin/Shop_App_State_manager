import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItemData = Provider.of<CartItem>(context);
    final cartData = Provider.of<Cart>(context);

    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: ListView.builder(
          itemCount: cartData.itemCount,
          itemBuilder: (context, index) => Container(
                child: Card(elevation: 5, child: Text(cartItemData.title)),
              )),
    );
  }
}
