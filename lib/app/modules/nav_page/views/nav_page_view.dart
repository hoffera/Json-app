// nav_page.dart
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_app/app/modules/home_page/views/home_page_view.dart';
import 'package:json_app/app/modules/login_page/views/login_page_view.dart';
import 'package:json_app/app/modules/nav_page/controllers/nav_page_controller.dart';

class NavPageView extends StatelessWidget {
  NavPageView({super.key}) {
    Get.put(NavPageController()).selectedIndex.value = 0;
  }

  final List<Widget> _widgetOptions = [const HomePageView(), LoginPageView()];

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavPageController>();

    return Obx(() {
      return Scaffold(
        body: _widgetOptions[navController.selectedIndex.value],
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: Colors.red,
          buttonBackgroundColor: Colors.black,
          color: Colors.blue,
          animationDuration: const Duration(milliseconds: 500),
          index: navController.selectedIndex.value,
          items: const [
            Icon(Icons.home, size: 26, color: Colors.white),
            Icon(Icons.navigation, size: 26, color: Colors.white),
          ],
          onTap: navController.changeIndex,
        ),
      );
    });
  }
}
