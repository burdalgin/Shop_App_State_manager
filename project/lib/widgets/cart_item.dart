import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/cart_screen.dart';

import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class CartItemView extends StatelessWidget {
  final String id;
  final int qantity;
  final String title;
  final String imageUrl;
  final double price;
  final String productId;

  CartItemView({
    @required this.id,
    @required this.qantity,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    @required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) //возвращает Bool Future элемент
          {
        return showDialog(
          context: context,
          builder: ((ctx) => AlertDialog(
                  title: Text('Are U SURE?'),
                  content:
                      Text('Do you want to remove the item from the cart??? '),
                  actions: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      icon: Icon(Icons.delete),
                      label: Text('Yes'),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      icon: Icon(Icons.disabled_by_default),
                      label: Text('NO'),
                    )
                  ])),
        );
      },
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      key: ValueKey(id),
      background: Container(
        alignment: Alignment.centerRight,
        color: Color.fromARGB(165, 222, 22, 8),
        child: Icon(
          Icons.delete,
          color: Color.fromARGB(168, 255, 255, 255),
          size: 40,
        ),
      ),
      child: Card(
          elevation: 5,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.network(
                  imageUrl,
                  fit: BoxFit.fitWidth,
                  width: 60,
                ),
                Spacer(),
                Text(title),
                Spacer(),
                Chip(label: Text(('${qantity}x').toString())),
                Chip(label: Text((price * qantity).toString())),
              ],
            ),
          )),
    );
  }
}
