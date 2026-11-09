import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/models/login_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:new_project/routes.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  final String apiUrl = "https://mediadwi.com/api/latihan/login";

  var loginModel = Rxn<LoginModels>();

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
       loginModel.value = LoginModels.fromJson(jsonDecode(response.body));

     if (loginModel.value?.status == true) {
        final prefs = await SharedPreferences.getInstance();
         await prefs.setString('token', loginModel.value!.token);
        await prefs.setString('username', username);
        Get.snackbar("Berhasil", loginModel.value!.message,
            backgroundColor: Colors.green, colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);    
        Get.offAllNamed(Routes.mainmenu);

      } else {
        Get.snackbar("Gagal", loginModel.value!.message,
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