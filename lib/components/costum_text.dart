import 'package:flutter/material.dart';

class CostumText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const CostumText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}