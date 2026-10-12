import 'package:new_project/calculator_page.dart';
import 'package:new_project/login_page.dart';
import 'package:new_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My App",
      initialRoute: Routes.listMakanan,
      getPages: Routes.myPages,
    );
  }
}