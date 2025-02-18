import 'package:flutter/material.dart';

class deatils extends StatefulWidget {
  const deatils({Key? key}) : super(key: key);

  @override
  State<deatils> createState() => _deatilsState();
}

class _deatilsState extends State<deatils> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {}),
      child: Row(
        children: [
          Text(
            'Deatils  ',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          CircleAvatar(
            child: IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: (() {}),
            ),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
