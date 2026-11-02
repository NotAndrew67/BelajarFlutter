import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/components/costum_button.dart';
import 'package:new_project/components/costum_text.dart';
import 'package:new_project/components/costum_textfield.dart';
import 'package:new_project/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Column(
        children: [
          const CostumText(text: "Welcome Boskuu", fontSize: 24, color: Colors.blue),
          Container(
            margin: const EdgeInsets.all(16),
            child: CostumTextfield(myHint: "input username", txtController: controller.txtUsername),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: CostumTextfield(myHint: "input password", txtController: controller.txtPassword, obscureText: true),
          ),
          const SizedBox(height: 16),
          Obx(
            () => controller.isLoading.value
                ? const CircularProgressIndicator()
                : CostumButton(label: "Login", onPressed: () => controller.login(), color: Colors.blue),
          ),
        ],
      ),
    );
  }
}