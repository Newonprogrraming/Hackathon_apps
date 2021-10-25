import 'package:flutter/material.dart';

class BordarLeftWidgets extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function() onTap;

  const BordarLeftWidgets({
    Key? key,
    required this.onTap,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomLeft: Radius.circular(60),
          ),
        ),
      ),
    );
  }
}
