import 'package:flutter/material.dart';
import 'package:new_project/components/costum_textfield.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
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
            )
           ),
        ],
    )
    );
  }
}