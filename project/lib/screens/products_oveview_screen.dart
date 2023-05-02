import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/cart_screen.dart';
import '../widgets/products_grid_view.dart';
import 'package:provider/provider.dart';
import '../widgets/badge.dart';
import '../providers/cart_provider.dart';
import '../widgets/main_drawer.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites)
                  _showOnlyFavorites = true;
                else
                  _showOnlyFavorites = false;
              });
            },
          ),
          Consumer<
                  Cart> //в данном случае не нужно использовать Provider.of(context) чтобы не обновлять весь Screen
              (
            builder: (_, cartData, childUpdate) => Badge(
              child:
                  childUpdate, //обновляется только chchildUpdate для того чтобы обновлялся только Badge а IconButton был статичным
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductsGridView(_showOnlyFavorites),
    );
  }
}
