import 'package:get/get.dart';

import '../pages/home_home/bindings/home_home_binding.dart';
import '../pages/home_home/views/home_home_view.dart';
import '../pages/home_json/bindings/home_json_binding.dart';
import '../pages/home_json/views/home_json_view.dart';
import '../pages/home_json_screen_page/bindings/home_json_screen_page_binding.dart';
import '../pages/home_json_screen_page/views/home_json_screen_page_view.dart';
import '../pages/home_page/bindings/home_page_binding.dart';
import '../pages/home_page/views/home_page_view.dart';
import '../pages/login_page/bindings/login_page_binding.dart';
import '../pages/login_page/views/login_page_view.dart';
import '../pages/logout_page/bindings/logout_page_binding.dart';
import '../pages/logout_page/views/logout_page_view.dart';
import '../pages/nav_page/bindings/nav_page_binding.dart';
import '../pages/nav_page/views/nav_page_view.dart';
import '../pages/register_page/bindings/register_page_binding.dart';
import '../pages/register_page/views/register_page_view.dart';
import '../pages/test_page/bindings/test_page_binding.dart';
import '../pages/test_page/views/test_page_view.dart';
import '../pages/weather_page/bindings/weather_page_binding.dart';
import '../pages/weather_page/views/weather_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.NAV_PAGE,
      page: () => NavPageView(),
      binding: NavPageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_HOME,
      page: () => const HomeHomeView(),
      binding: HomeHomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE,
      page: () => RegisterPageView(),
      binding: RegisterPageBinding(),
    ),
    GetPage(
      name: _Paths.TEST_PAGE,
      page: () => TestPageView(),
      binding: TestPageBinding(),
    ),
    GetPage(
      name: _Paths.WEATHER_PAGE,
      page: () => WeatherPageView(),
      binding: WeatherPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_JSON,
      page: () => const HomeJsonView(),
      binding: HomeJsonBinding(),
    ),
    GetPage(
      name: _Paths.HOME_JSON_SCREEN_PAGE,
      page: () => JsonScreenPage(jsonPath: ''),
      binding: HomeJsonScreenPageBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT_PAGE,
      page: () => const LogoutPageView(),
      binding: LogoutPageBinding(),
    ),
  ];
}
