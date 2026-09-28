import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var hasilHitung = 0.0.obs;

  void _warning(String pesan) {
    Get.snackbar(
      "Peringatan",
      pesan,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  bool _valid(String a, String b) {
    if (a.trim().isEmpty || b.trim().isEmpty) {
      _warning("Angka 1 dan Angka 2 tidak boleh kosong");
      return false;
    }
    return true;
  }

  void tambah(String a, String b) {
    if (!_valid(a, b)) return;
    double hasil = double.parse(a) + double.parse(b);
    hasilHitung.value = hasil;
    Get.snackbar("Hasil tambah", "Hasilnya " + hasil.toString());
  }

  void kurang(String a, String b) {
    if (!_valid(a, b)) return;
    double hasil = double.parse(a) - double.parse(b);
    hasilHitung.value = hasil;
    Get.snackbar("Hasil kurang", "Hasilnya " + hasil.toString());
  }

  void kali(String a, String b) {
    if (!_valid(a, b)) return;
    double hasil = double.parse(a) * double.parse(b);
    hasilHitung.value = hasil;
    Get.snackbar("Hasil kali", "Hasilnya " + hasil.toString());
  }

  void bagi(String a, String b) {
    if (!_valid(a, b)) return;
    if (double.parse(b) == 0) {
      _warning("Angka 2 tidak boleh 0 untuk pembagian");
      return;
    }
    double hasil = double.parse(a) / double.parse(b);
    hasilHitung.value = hasil;
    Get.snackbar("Hasil bagi", "Hasilnya " + hasil.toString());
  }
}