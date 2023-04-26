import '../screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({Key key}) : super(key: key);

//  final String id;
  //final String title;
  // final String imageUrl;

  //ProductItem({
  //  this.id,
  ///  this.title,
  //  this.imageUrl,
  //});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
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
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          )),
    );
  }
}
