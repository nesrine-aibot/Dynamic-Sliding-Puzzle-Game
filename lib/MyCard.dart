import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final int number;
  const MyCard({Key? key, required this.number}) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.number;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: (Colors.pink[100] ?? Colors.pink).withOpacity(1.0),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: Text(
          number != 0 ? number.toString() : '',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
