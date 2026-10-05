import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/components/costum_textfield.dart';
import 'package:new_project/routes.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

  final List<String> genderList = ["Laki-laki", "Perempuan"];
  String? selectedGender;

  @override
  void dispose() {
    txtUsername.dispose();
    txtPassword.dispose();
    txtEmail.dispose();
    txtPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text("Registration"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white, // warna title & icon
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: CostumTextfield(
                myHint: "input username",
                txtController: txtUsername,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: CostumTextfield(
                myHint: "input password",
                txtController: txtPassword,
                obscureText: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: CostumTextfield(
                myHint: "input email",
                txtController: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                value: selectedGender,
                hint: const Text("pilih jenis kelamin"),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: genderList
                    .map(
                      (gender) => DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: CostumTextfield(
                myHint: "input nomor telepon",
                txtController: txtPhone,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final username = txtUsername.text.trim();
                final password = txtPassword.text.trim();
                final email = txtEmail.text.trim();
                final phone = txtPhone.text.trim();

                final List<String> kosong = [];
                if (username.isEmpty) kosong.add("Username");
                if (password.isEmpty) kosong.add("Password");
                if (email.isEmpty) kosong.add("Email");
                if (selectedGender == null) kosong.add("Jenis kelamin");
                if (phone.isEmpty) kosong.add("Nomor telepon");

                if (kosong.isNotEmpty) {
                  Get.snackbar(
                    "Data belum lengkap",
                    "${kosong.join(", ")} harus diisi",
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                Get.toNamed(
                  Routes.confirmRegistration,
                  arguments: {
                    'username': username,
                    'password': password,
                    'email': email,
                    'gender': selectedGender,
                    'phone': phone,
                  },
                );
              },
              child: const Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}
