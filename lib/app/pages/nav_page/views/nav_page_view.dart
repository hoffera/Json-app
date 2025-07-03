import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/app/pages/nav_page/controllers/nav_page_controller.dart';

class NavPageView extends GetView<NavPageController> {
  const NavPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.pages[controller.currentIndex.value],
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: Colors.black,
          buttonBackgroundColor: AppColors.primary,
          color: AppColors.primary,
          animationDuration: const Duration(milliseconds: 500),
          index: controller.currentIndex.value,
          items: const [
            Icon(Icons.home, size: 26, color: Colors.white),
            Icon(Icons.settings, size: 26, color: Colors.white),
          ],
          onTap: controller.changePage,
        ),
      );
    });
  }
}
