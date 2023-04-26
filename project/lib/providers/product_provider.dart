import 'package:flutter/foundation.dart'; //позволяет использовать @requried

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

//сипользуються Named arguments - при вызове класса будет предлагать список аргументов по именам
  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite =
        false, //так как используется Optional Positional argument, при вызове класса можно не задавать значение, будет установлено по Default
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners(); //аналог SetState
  }
}
