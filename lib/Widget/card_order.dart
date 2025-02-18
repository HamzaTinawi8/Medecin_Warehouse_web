import 'package:flutter/material.dart';
import 'package:web_medecin_warehouse/Services/service.dart';
import 'package:web_medecin_warehouse/Widget/deatils_order.dart';

class Cardorder extends StatefulWidget {
  int id;
  String x;
  String y;
  String date;
  String payment_status;
  int i;
  final dynamic onchanged;

  Cardorder(
      {required this.id,
      required this.x,
      required this.y,
      required this.date,
      required this.payment_status,
      required this.i,
      this.onchanged});

  @override
  State<Cardorder> createState() => _CardorderState();
}

class _CardorderState extends State<Cardorder> {
  String? status;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.green,

                    // blurRadius: 5,
                    offset: Offset(0, 4))
              ],
              //  border: Border.all(color: Colors.red , width: 2),
              borderRadius: BorderRadius.circular(18),
              color: Colors.white70),
          height: 200,
          width: 200,
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Order ${widget.id} ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Row(
                    children: [
                      Text(
                        'Price :',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      Text(
                        '${widget.x}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'State of talab : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      Text(
                        '${widget.y}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'State of payment : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      Text(
                        '${widget.payment_status}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 150,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${widget.date}',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                DropdownButton(
                  hint: const Text("change the status"),
                  value: status,
                  icon: const Icon(Icons.menu),
                  items: [
                    DropdownMenuItem<String>(
                        value: 'sent', child: Text('sent')),
                    DropdownMenuItem<String>(
                        value: 'recevied', child: Text('received'))
                  ],
                  onChanged: (String? val) {
                    setState(() {
                      status = val;
                      (status == 'sent')
                          ? Services().changestatus(id: widget.id , x:"sent" )
                          : Services().changestatus(id: widget.id, x: "received");
                      widget.onchanged();
                    });
                  },
                )
              ],
            )
          ]),
        ));
  }
}
