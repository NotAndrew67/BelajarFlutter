import 'package:new_project/pages/confirm_registration_page.dart';
import 'package:new_project/pages/registration_page.dart';
import 'package:new_project/pages/list_makanan_page.dart';
import 'package:new_project/pages/detail_list_makanan.dart';
import 'package:new_project/pages/main_menu.dart';
import 'package:get/get.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirmRegistration = "/confirmRegistration";
  static const String listMakanan = "/listMakanan";
  static const String detailMakanan = "/detailMakanan";
  static const String main_menu = "/main_menu";

  static final myPages = [  
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirmRegistration, page: () => ConfirmRegistrationPage()),
    GetPage(name: listMakanan, page: () => ListMakananPage()),
    GetPage(name: detailMakanan, page: () => DetailListMakananPage()),
    GetPage(name: main_menu, page: () => MainMenuPage()),
  ];
}