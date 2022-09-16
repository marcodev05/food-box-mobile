import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  TextOverflow overflow;
  double size;
  BigText({Key? key,
    required this.text,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.size=20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: size,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.8),
    );
  }
}
