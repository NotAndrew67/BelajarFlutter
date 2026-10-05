import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CostumTextfield extends StatelessWidget {
  final String myHint;
  final TextEditingController txtController;
  final Color? color;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  const CostumTextfield({
    super.key,
    required this.myHint,
    required this.txtController,
    this.color,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: myHint,
        enabledBorder: color == null
            ? null
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: color!),
              ),
        focusedBorder: color == null
            ? null
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: color!, width: 2),
              ),
      ),
    );
  }
}