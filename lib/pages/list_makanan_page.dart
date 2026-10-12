import 'package:flutter/material.dart';
import 'package:new_project/controllers/list_makanan_controller.dart';
import 'package:get/get.dart';

class ListMakananPage extends StatelessWidget {
  ListMakananPage({super.key});

  final controller = Get.put(ListMakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Makanan"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: controller.listMakanan.length,
          itemBuilder: (context, index) {
            final makanan = controller.listMakanan[index];

            return InkWell(
              onTap: () {
                Get.toNamed(
                  "/detailMakanan",
                  arguments: makanan,
                );
              },
              child: ListTile(
                title: Text(
                  makanan.namaMakanan,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "Rp ${makanan.harga}",
                  style: const TextStyle(fontSize: 15),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}