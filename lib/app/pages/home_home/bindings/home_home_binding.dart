import 'package:get/get.dart';

import '../controllers/home_home_controller.dart';

class HomeHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeHomeController>(
      () => HomeHomeController(),
    );
  }
}
