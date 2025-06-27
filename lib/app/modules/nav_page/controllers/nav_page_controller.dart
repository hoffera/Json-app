import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:json_app/app/modules/home_page/bindings/home_page_binding.dart';
import 'package:json_app/app/modules/home_page/views/home_page_view.dart';
import 'package:json_app/app/modules/login_page/bindings/login_page_binding.dart';
import 'package:json_app/app/modules/login_page/views/login_page_view.dart';

class NavPageController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    if (index == 0) {
      // HomePage via navegação com binding
      Get.to(() => HomePageView(), binding: HomePageBinding());
    } else if (index == 1) {
      // LoginPage via navegação com binding
      Get.to(() => LoginPageView(), binding: LoginPageBinding());
    }
    // Opcionalmente atualize o selectedIndex se quiser controlar abas
    selectedIndex.value = index;
  }
}
