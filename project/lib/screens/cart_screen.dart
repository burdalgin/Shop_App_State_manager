import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    final productData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartData.itemCount,
              itemBuilder: (ctx, index) => Container(
                child: CartItemView(
                  id: cartData.item.values
                      .toList()[index]
                      .id, //как получить доступ к значениям из MAP - перевести Values.toList() потом [Index] потом самое поле значений
                  qantity: cartData.item.values.toList()[index].quantity,
                  title: cartData.item.values.toList()[index].title,
                  price: cartData.item.values.toList()[index].price,
                  imageUrl: productData.items
                      .firstWhere((element) =>
                          element.title ==
                          cartData.item.values.toList()[index].title)
                      .imageUrl,
                  productId: cartData.item.keys.toList()[index],
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Text("Total SUM"),
              title: Chip(
                label: Text('\$${cartData.totalAmount}'),
              ),
              trailing: TextButton.icon(
                  onPressed: (() {
                    Provider.of<Orders>(context, listen: false).addOrder(
                        cartData.item.values.toList(), cartData.totalAmount);
                    cartData.clearCart();
                  }),
                  icon: Icon(Icons.access_time_sharp),
                  label: Text('ORDER NOW')),
            ),
          ),
        ],
      ),
    );
  }
}
