import 'package:flutter/material.dart';

class drawerElements extends StatelessWidget {
  final String containerText;
  final Color containerColor;
  final IconData containerIcon;

  drawerElements(
      {required this.containerText,
      required this.containerColor,
      required this.containerIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: containerColor),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              containerText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              containerIcon,
              size: 26,
            ),
          ],
        ));
  }
}
