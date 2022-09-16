import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  TextOverflow overflow;
  double size;
  double height;
  SmallText({Key? key,
    required this.text,
    this.color = Colors.blueGrey,
    this.overflow = TextOverflow.ellipsis,
    this.size=14,
    this.height=1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 5,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: size,
          height: height,
          letterSpacing: 1.3),
    );
  }
}
