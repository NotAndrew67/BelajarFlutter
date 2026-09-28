import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/components/costum_textfield.dart';
import 'package:new_project/controllers/calculator_controller.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    TextEditingController txtangka1 = TextEditingController();
    TextEditingController txtangka2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("My Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CostumTextfield(
              myHint: "Input Angka 1",
              txtController: txtangka1,
            ),
            const SizedBox(height: 16),

            CostumTextfield(
              myHint: "Input Angka 2",
              txtController: txtangka2,
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    controller.tambah(txtangka1.text, txtangka2.text);
                  },
                  child: const Text("+"),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    controller.kurang(txtangka1.text, txtangka2.text);
                  },
                  child: const Text("-"),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    controller.kali(txtangka1.text, txtangka2.text);
                  },
                  child: const Text("×"),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    controller.bagi(txtangka1.text, txtangka2.text);
                  },
                  child: const Text("÷"),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Obx(
              () => Text(
                "Hasil: ${controller.hasilHitung.value}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}