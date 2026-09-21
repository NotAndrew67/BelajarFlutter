import 'package:flutter/material.dart';

class CostumButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  const CostumButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(text),
    );
  }
}