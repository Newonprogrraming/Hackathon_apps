import 'package:flutter/material.dart';

class BordarRightWidgets extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function() onTap;

  const BordarRightWidgets({
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
        margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
      ),
    );
  }
}
