import 'package:flutter/material.dart';
import 'package:web_medecin_warehouse/Screens/craet_prodcts.dart';
import 'package:web_medecin_warehouse/Widget/drawer.dart';

class Start extends StatelessWidget {
  Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("welcome")),
      ),
      body: Center(child: Container(child: Image.network('assets/images/home.jpg'))),
      drawer: DrawerWidget()
    );
  }
}
