import 'package:get/get.dart';
import 'package:json_app/app/modules/home_page/bindings/home_page_binding.dart';
import 'package:json_app/app/modules/home_page/views/home_page_view.dart';
import 'package:json_app/app/modules/logout_page/bindings/logout_page_binding.dart';
import 'package:json_app/app/modules/logout_page/views/logout_page_view.dart';
import 'package:json_app/app/modules/test_page/views/test_page_view.dart';
import 'package:json_app/app/modules/weather_page/bindings/weather_page_binding.dart';
import 'package:json_app/app/modules/weather_page/views/weather_page_view.dart';

class NavPageController extends GetxController {
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    HomePageBinding().dependencies();
    LogoutPageBinding().dependencies();
  }

  final pages = [const HomePageView(), LogoutPageView()];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
