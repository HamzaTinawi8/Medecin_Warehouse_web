import 'package:flutter/material.dart';
import 'package:web_medecin_warehouse/Screens/craet_prodcts.dart';
import 'package:web_medecin_warehouse/Screens/show_all_orders.dart';
import 'package:web_medecin_warehouse/Screens/show_all_products.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Center(
              child: Text(
            'your information',
            style: TextStyle(fontSize: 20),
          )),
        ),
        ListTile(
          title: Text('create Prouduct'),
          leading: Icon(Icons.create_new_folder),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return CreatProduct();
              }),
            );
          },
        ),
        ListTile(
          title: Text('Show All Products'),
          leading: Icon(Icons.slideshow),
          onTap: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return AllProductsScreen();
              }),
            );
          },
        ),
        ListTile(
          title: Text('Show All Orders'),
          leading: Icon(Icons.calendar_month_outlined),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return OrdersScreen();
              }),
            );
          },
        ),
      ])
    );
  }
}
