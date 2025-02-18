import 'package:flutter/material.dart';
import 'package:web_medecin_warehouse/Services/service.dart';
import 'package:web_medecin_warehouse/Widget/card_order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String? state;
  int inum = 0;

  @override
  Widget build(BuildContext context) {
    return (FutureBuilder<dynamic>(
        future: Services().getallorder(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['The Orders '].isEmpty) {
              return Scaffold(
                appBar: AppBar(
                  title: const Center(child: Text("welcome")),
                ),
                body: const Center(
                  child: Text('no orders'),
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(
                title: const Center(child: Text("welcome")),
              ),
              body: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                ),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: SizedBox(
                        width: 600,
                        child: ListView.builder(
                            itemCount: snapshot.data!['The Orders '].length,
                            itemBuilder: (context, i) {
                              if (snapshot.data!['The Orders '][i]
                                      ['Payment_Status'] ==
                                  1) {
                                state = 'paid';
                              } else {
                                state = 'not paid';
                              }
                              inum++;
                              return Cardorder(
                                id :snapshot.data!['The Orders '][i]['id'],
                                x: '${snapshot.data!['The Orders '][i]['Final_Price']}',
                                y: '${snapshot.data!['The Orders '][i]['Status']}',
                                date:
                                    '${snapshot.data!['The Orders '][i]['created_at']}'
                                        .substring(0, 10),
                                payment_status: '$state',
                                i: inum,
                                onchanged: (){ setState(() {
                                  
                                });},
                              );
                            }),
                      ),
                    ))
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }));
  }
}
