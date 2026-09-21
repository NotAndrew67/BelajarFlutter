import 'package:flutter/material.dart';
import 'package:new_project/components/costum_button.dart';
import 'package:new_project/components/costum_text.dart';
import 'package:new_project/components/costum_textfield.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();

  double? _hasil;

  void _hitung(String operasi) {
    double angka1 = double.tryParse(_angka1Controller.text) ?? 0;
    double angka2 = double.tryParse(_angka2Controller.text) ?? 0;

    setState(() {
      switch (operasi) {
        case 'tambah':
          _hasil = angka1 + angka2;
          break;
        case 'kurang':
          _hasil = angka1 - angka2;
          break;
        case 'kali':
          _hasil = angka1 * angka2;
          break;
        case 'bagi':
          if (angka2 != 0) {
            _hasil = angka1 / angka2;
          } else {
            _hasil = double.nan;
          }
          break;
      }
    });
  }

  String displayText() {
    if (_hasil == null) {
      return "Hasil";
    } else if (_hasil!.isNaN) {
      return "Hasil: Error";
    } else {
      return "Hasil: $_hasil";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CostumTextfield(hint: "Angka 1", txtcCntroller: _angka1Controller),
            const SizedBox(height: 16),
            CostumTextfield(hint: "Angka 2", txtcCntroller: _angka2Controller),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CostumButton(
                  text: "+",
                  onPressed: () => _hitung('tambah'),
                  color: Colors.blue,
                ),
                CostumButton(
                  text: "-",
                  onPressed: () => _hitung('kurang'),
                  color: Colors.red,
                ),
                CostumButton(
                  text: "*",
                  onPressed: () => _hitung('kali'),
                  color: Colors.green,
                ),
                CostumButton(
                  text: "/",
                  onPressed: () => _hitung('bagi'),
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 24),
            CostumText(text: displayText(), fontSize: 20, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
