
import 'package:flutter/material.dart';
import 'package:new_project/components/costum_button.dart';
import 'package:new_project/components/costum_text.dart';
import 'package:new_project/components/costum_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Column(
        children: [
          CostumText(
            text: statusLogin.isEmpty
                ? "Welcome Boskuu"
                : "Welcome Boskuu, $statusLogin",
            fontSize: 24,
            color: Colors.blue,
          ),

          Container(
            margin: EdgeInsets.all(16),
            child: CostumTextfield(
              myHint: "input username",
              txtController: txtUsername,
            ),
          ),

          Container(
            margin: EdgeInsets.all(16),
            child: CostumTextfield(
              myHint: "input password",
              txtController: txtPassword,
            ),
          ),

          SizedBox(height: 16),
          CostumButton(
            label: "Login",
            onPressed: () {
              setState(() {
                String username = txtUsername.text.toString();
                String password = txtPassword.text.toString();
                if (username == "admin" && password == "admin") {
                  statusLogin = "admin";
                  print("Sukses Login");
                } else {
                  statusLogin = "failed";
                  print("Gagal Login");
                }
              });
            },
            color: Colors.blue,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
