import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/models/login_models.dart';
import 'package:new_project/routes.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  final String apiUrl = "https://mediadwi.com/api/latihan/login";

  Future<void> login() async {
    final username = txtUsername.text.trim();
    final password = txtPassword.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Peringatan", "Jangan kosong!", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          "username": username,
          "password": password,
        },
      );

      isLoading.value = false;
      final data = LoginModels.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200 && data.status == true) {
        Get.snackbar("Berhasil", data.message,
            backgroundColor: Colors.green, colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed(Routes.main_menu);
      } else {
        Get.snackbar("Gagal", data.message,
            backgroundColor: Colors.red, colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Gagal konek ke server",
          backgroundColor: Colors.red, colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}