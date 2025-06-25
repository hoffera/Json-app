import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_app/components/graphs/linear_graph.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePageView'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            LinearGraph(value: 10, maximum: 50, minimum: 1),
            LinearGraph(value: 1, maximum: 10, minimum: 1),
          ],
        ),
      ),
    );
  }
}
