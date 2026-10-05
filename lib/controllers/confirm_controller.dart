import 'package:get/get.dart';

class ConfirmRegistrationController extends GetxController {
  late String username;
  late String email;
  late String gender;
  late String phone;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    username = arguments['username'];
    email = arguments['email'];
    gender = arguments['gender'];
    phone = arguments['phone'];
  }
}