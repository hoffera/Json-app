// nav_page.dart
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/app/modules/home_page/views/home_page_view.dart';
import 'package:json_app/app/modules/login_page/views/login_page_view.dart';
import 'package:json_app/app/modules/nav_page/controllers/nav_page_controller.dart';

class NavPageView extends StatelessWidget {
  NavPageView({super.key}) {
    Get.put(NavPageController()).selectedIndex.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavPageController>();

    return Obx(() {
      return Scaffold(
        body: Container(), // ou algum widget básico
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: AppColors.background,
          buttonBackgroundColor: AppColors.primary,
          color: AppColors.primary,
          animationDuration: const Duration(milliseconds: 500),
          index: navController.selectedIndex.value,
          items: const [
            Icon(Icons.home, size: 26, color: Colors.white),
            Icon(Icons.settings, size: 26, color: Colors.white),
          ],
          onTap: navController.changeIndex,
        ),
      );
    });
  }
}
