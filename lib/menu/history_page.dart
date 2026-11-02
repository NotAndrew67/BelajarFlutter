import 'package:flutter/material.dart';
import 'package:new_project/components/costum_drawer.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Page"),
      ),
      drawer: const CostumDrawer(),
      body: const Center(child: Text("ini History page")),
    );
  }
}
