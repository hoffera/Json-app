import 'package:get/get.dart';

import '../controllers/logout_page_controller.dart';

class LogoutPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogoutPageController>(
      () => LogoutPageController(),
    );
  }
}
