import 'package:flutter/material.dart';

class CostumButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const CostumButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}