import 'package:get/get.dart';

import '../controllers/weather_page_controller.dart';

class WeatherPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherPageController>(() => WeatherPageController());
  }
}
