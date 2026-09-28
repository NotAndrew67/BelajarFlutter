import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CostumTextfield extends StatelessWidget {
  final String myHint;
  final TextEditingController txtController;
  final Color color;

  const CostumTextfield({
    super.key,
    required this.myHint,
    required this.txtController,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
      ],
      decoration: InputDecoration(
        hintText: myHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color, width: 2),
        ),
      ),
    );
  }
}