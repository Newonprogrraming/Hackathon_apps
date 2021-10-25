import 'package:flutter/material.dart';

class CardVisa extends StatelessWidget {
  final Color color;
  const CardVisa({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268.0,
      height: 160.0,
      child: const Align(
        child: Text(
          "VISA",
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
        ),
        alignment: Alignment.bottomRight,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}
