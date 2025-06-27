import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_app/components/background/background_degrade.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Obx(() {
          final weather = controller.weather.value;

          if (weather == null) {
            return const CircularProgressIndicator(color: Colors.red);
          }

          return BackgroundDegrade(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("lib/assets/rive/1.png")),
                Text(
                  'Cidade: ${weather.city}',
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
                const SizedBox(height: 10),
                Text(
                  'Temperatura: ${weather.temperatures.first}°C',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
