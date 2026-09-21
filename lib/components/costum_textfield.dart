import 'package:flutter/material.dart';

class CostumTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController txtcCntroller;
  const CostumTextfield({
    super.key,
    required this.hint,
    required this.txtcCntroller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtcCntroller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
