import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:new_project/routes.dart';

class ProfileController extends GetxController {
  final RxString name = "Andrew".obs;
  final RxString email = "andrew@example.com".obs;
  final RxString memberStatus = "Gold Member".obs;
  final RxInt orders = 14.obs;
  final RxInt vouchers = 5.obs;
  final RxInt points = 2450.obs;

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('username');

    Get.snackbar(
      "Logout",
      "Berhasil keluar akun",
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.offAllNamed(Routes.login);
  }
}
