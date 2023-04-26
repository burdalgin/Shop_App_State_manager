import '../providers/cart_provider.dart';

import '../screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,
        listen:
            false); //задаем Listen: false для того чтобы из-за обновления данные не происходил REbuild всего виджета а только того который завернут в Consumer
    final cart = Provider.of<Cart>(context, listen: false);
    return
        //аналог Provider
        ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Color.fromARGB(50, 0, 0, 0),
            leading: IconButton(
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              icon: Consumer<Product>(
                // будет Rebuild только виджетов заврнутых в Consumer
                builder: (context, value, _) => Icon(product
                        .isFavorite //вместо _ указывается child если есть часть Widget tree которую мы хотим исключить из Rebuild
                    ? Icons.favorite
                    : Icons.favorite_border),
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  cart.addItem(product.id, product.price, product.title);
                },
                icon: Icon(Icons.shopping_cart)),
          )),
    );
  }
}
