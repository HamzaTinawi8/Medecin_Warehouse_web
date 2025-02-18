import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_medecin_warehouse/Services/service.dart';
import 'package:web_medecin_warehouse/Widget/Row_inCard.dart';

class CardProducts extends StatefulWidget {
  String photo;
  String scientific_Name;
  String Company_Name;
  String Category_Name;
  String Price;
  int Quantity_Available;
  var id;
  final dynamic onDeleted;

  CardProducts({
    required this.photo,
    required this.scientific_Name,
    required this.Category_Name,
    required this.Company_Name,
    required this.Quantity_Available,
    required this.Price,
    required this.id,
    this.onDeleted,
  });

  @override
  State<CardProducts> createState() => _CardProductsState();
}

class _CardProductsState extends State<CardProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(color: Colors.green, offset: Offset(0, 4))
          ], borderRadius: BorderRadius.circular(18), color: Colors.white70),
          height: 200,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Image.asset(
                'assets/images/home.jpg',
                height: 120,
                width: 120,
              ),
              //  Image.network(
              //              'http://127.0.0.1:8000/${widget.x}',
              //                height: 120,
              //                width: 120,

              //              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RowCard(x: widget.scientific_Name, y: 'Scientific_Name'),
                    RowCard(
                        x: widget.Quantity_Available, y: 'Quantity_Available'),
                    RowCard(x: widget.Company_Name, y: 'Company_Name'),
                    RowCard(x: widget.Category_Name, y: 'Category_Name'),
                    RowCard(x: widget.Price, y: 'Price'),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              ' Warning ! ',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20),
                            ),
                            content: const Text(
                              ' Are you sure to delete this product ?',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    await Services()
                                        .deleteproduct(x: widget.id);
                                    widget.onDeleted();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('ok')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel')),
                            ],
                            contentPadding: const EdgeInsets.all(30),
                          );
                        });
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Row(
                    children: [
                      Text('Delete the product '),
                      Icon(Icons.delete_outline_rounded)
                    ],
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
