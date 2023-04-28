import 'package:flutter/material.dart';
import './product_item.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsGridView extends StatelessWidget {
  final bool showFavorite;

  ProductsGridView(this.showFavorite);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(
        context); // в провайдере указывается тип провайдера <Products>
    final products = showFavorite
        ? productsData.favoriteItems
        : productsData
            .items; //получаем доступ к item потому что в классе провайдера прописали get ...items

    return GridView.builder(
      padding: const EdgeInsets.all(
          10.0), //const для того чтобы не происходил ReBuild
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        //используется .value в случае когда "слушаем" только данные но не context
        value: products[index],
        child: ProductItem(
            // id: products[index].id,
            //  imageUrl: products[index].imageUrl,
            //  title: products[index].title,
            ),
      ),
    );
  }
}
