import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:json_app/app/modules/home_home/views/home_home_view.dart';
import 'package:json_app/app/modules/home_page/bindings/home_page_binding.dart';
import 'package:json_app/app/modules/home_page/views/home_page_view.dart';
import 'package:json_app/app/modules/login_page/views/login_page_view.dart';
import 'package:json_app/app/modules/nav_page/views/nav_page_view.dart';
import 'package:json_app/app/modules/test_page/views/test_page_view.dart';
import 'package:json_app/app/modules/weather_page/controllers/weather_page_controller.dart';

import 'package:json_app/app/themes/theme_provider.dart';
import 'package:json_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:json_app/components/alert/loading_alert.dart';
import 'package:json_app/firebase_options.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_app/app/routes/app_pages.dart';
import 'package:json_app/components/custom_widget_registrar.dart';
import 'package:provider/provider.dart';

final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;
late final FirebaseApp app;
late final FirebaseAuth auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  Get.put(AuthController());

  registry.navigatorKey = GlobalKey<NavigatorState>();

  CustomWidgetRegistrar.registerDefaults(registry: registry);
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );

  registry.registerFunction(
    'fetchWeather',
    ({args, required registry}) => () async {
      final controller = Get.find<WeatherPageController>();
      await controller.fetchWeather();
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      navigatorKey: registry.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'JSON App',
      home: TestPageView(),
      getPages: AppPages.routes,
    );
  }
}

class RouteScreens extends StatelessWidget {
  RouteScreens({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.firebaseUser.value == null) {
        print("authController.firebaseUser.value");
        print(authController.firebaseUser.value);
        // Navega para home-home
        Future.microtask(() => Get.offAllNamed('/home-home'));
        return Container();
      } else {
        // Navega para home
        Future.microtask(() => Get.offAllNamed('/nav-page'));
        return Container();
      }
    });
  }
}
