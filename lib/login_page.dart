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
    return Theme(
      data: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                Image.network(
                  "https://imgs.search.brave.com/mn9XyHvMsLVsHRsq48o58VagLPOcznAJY8KM2csZMjY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9sb2dv/dHlwLnVzL2ZpbGUv/c3BvdGlmeS5zdmc",
                  width: 580,
                  height: 200,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.headphones_rounded,
                      size: 60,
                      color: Color(0xFF1ED760),
                    );
                  },
                ),

                const SizedBox(height: 24),

                const CostumText(
                  text: "Log in to Spotify",
                  fontSize: 28,
                  color: Colors.white,
                ),

                const SizedBox(height: 36),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: CostumTextfield(
                    myHint: "Email or username",
                    txtController: controller.txtUsername,
                    color: const Color(0xFF1ED760),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: CostumTextfield(
                    myHint: "Password",
                    txtController: controller.txtPassword,
                    obscureText: true,
                    color: const Color(0xFF1ED760),
                  ),
                ),

                const SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFF1ED760),
                            ),
                          )
                        : CostumButton(
                            label: "Log In",
                            onPressed: () => controller.login(),
                            color: const Color(0xFF1ED760),
                          ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
