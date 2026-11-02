import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controllers/main_menu_controller.dart';

class CostumDrawer extends StatelessWidget {
  const CostumDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil controller MainMenu yang mengatur selectedIndex
    final MainMenuController mainMenuController =
        Get.isRegistered<MainMenuController>()
            ? Get.find<MainMenuController>()
            : Get.put(MainMenuController());

    return Drawer(
      // Lebar drawer dibuat 50% (setengah) dari lebar layar
      width: MediaQuery.of(context).size.width * 0.5,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.menu_open_rounded,
                  color: Colors.white,
                  size: 32,
                ),
                SizedBox(height: 8),
                Text(
                  "Navigasi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              selected: mainMenuController.selectedIndex.value == 0,
              selectedColor: Colors.blue,
              selectedTileColor: Colors.blue.withOpacity(0.1),
              onTap: () {
                mainMenuController.changePage(0);
                Navigator.pop(context); // Tutup drawer setelah memilih
              },
            ),
          ),
          Obx(
            () => ListTile(
              leading: const Icon(Icons.history_outlined),
              title: const Text("History"),
              selected: mainMenuController.selectedIndex.value == 1,
              selectedColor: Colors.blue,
              selectedTileColor: Colors.blue.withOpacity(0.1),
              onTap: () {
                mainMenuController.changePage(1);
                Navigator.pop(context); // Tutup drawer setelah memilih
              },
            ),
          ),
          Obx(
            () => ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text("Profile"),
              selected: mainMenuController.selectedIndex.value == 2,
              selectedColor: Colors.blue,
              selectedTileColor: Colors.blue.withOpacity(0.1),
              onTap: () {
                mainMenuController.changePage(2);
                Navigator.pop(context); // Tutup drawer setelah memilih
              },
            ),
          ),
        ],
      ),
    );
  }
}
