import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RowCard extends StatefulWidget {
  var x;
  String y;
  RowCard({required this.x, required this.y});

  @override
  State<RowCard> createState() => _RowCardState();
}

class _RowCardState extends State<RowCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget.y}:',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        Text(
          '${widget.x}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
