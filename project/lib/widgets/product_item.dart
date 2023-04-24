import '../screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({Key key}) : super(key: key);

  final String id;
  final String title;
  final String imageUrl;

  ProductItem({
    this.id,
    this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetailScreen.routeName, arguments: id);
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Color.fromARGB(50, 0, 0, 0),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
            ),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          )),
    );
  }
}
