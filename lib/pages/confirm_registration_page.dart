import 'package:new_project/controllers/confirm_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ConfirmRegistrationPage extends StatelessWidget {
  const ConfirmRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConfirmRegistrationController());

    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Registration")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username: ${controller.username}",
              style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            ),
            Text(
              "Email: ${controller.email}",
              style: const TextStyle(fontSize: 20, color: Colors.lightGreen),
            ),
            Text(
              "Jenis Kelamin: ${controller.gender}",
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              "No. Telepon: ${controller.phone}",
              style: const TextStyle(fontSize: 20, color: Colors.redAccent),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}
