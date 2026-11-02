import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:new_project/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  final String initialRoute = (token != null && token.isNotEmpty) 
      ? Routes.main_menu 
      : Routes.login;

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My App",
      initialRoute: initialRoute,
      getPages: Routes.myPages,
    );
  }
}