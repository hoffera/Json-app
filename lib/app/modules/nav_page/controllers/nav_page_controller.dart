import 'package:get/get.dart';
import 'package:json_app/app/modules/home_page/bindings/home_page_binding.dart';
import 'package:json_app/app/modules/home_page/views/home_page_view.dart';
import 'package:json_app/app/modules/test_page/views/test_page_view.dart';
import 'package:json_app/app/modules/weather_page/bindings/weather_page_binding.dart';
import 'package:json_app/app/modules/weather_page/views/weather_page_view.dart';

class NavPageController extends GetxController {
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    HomePageBinding().dependencies();
    WeatherPageBinding().dependencies();
  }

  final pages = [const HomePageView(), WeatherPageView()];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
