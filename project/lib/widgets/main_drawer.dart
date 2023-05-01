import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';

class ListTileWidget extends StatelessWidget {
  final String pageTitle;
  final IconData icon;
  final Function() tapHandler;

  ListTileWidget({
    @required this.pageTitle,
    @required this.icon,
    @required this.tapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(pageTitle),
      onTap: tapHandler,
    );
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Text('Cooking Up',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
          ),
          SizedBox(
            height: 20,
          ),
          ListTileWidget(
            pageTitle: 'Orders',
            icon: Icons.shopping_cart_checkout_rounded,
            tapHandler: () {
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
