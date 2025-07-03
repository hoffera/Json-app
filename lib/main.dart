import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:json_app/app/pages/antonina/antonina_page.dart';
import 'package:json_app/app/pages/home_json/bindings/home_json_binding.dart';
import 'package:json_app/app/pages/home_json_screen_page/views/full_widget_page.dart';
import 'package:json_app/app/pages/test_page/views/test.dart';
import 'package:json_app/app/pages/test_page/views/test_page_view.dart';
import 'package:json_app/app/pages/weather_page/controllers/weather_page_controller.dart';
import 'package:json_app/app/themes/theme_provider.dart';
import 'package:json_app/app/pages/auth/controllers/auth_controller.dart';
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
  // runApp(MyApp());
  registry.registerFunction('navigatePage', ({args, required registry}) {
    return () {
      rootBundle.loadString('lib/assets/json_pages/${args![0]}.json').then((
        jsonStr,
      ) {
        final jsonData = json.decode(jsonStr);
        registry.navigatorKey!.currentState!.push(
          MaterialPageRoute(
            builder: (BuildContext context) => FullWidgetPage(
              data: JsonWidgetData.fromDynamic(jsonData, registry: registry),
            ),
          ),
        );
      });
    };
  });

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
      title: 'Weather App',
      home: AntoninaPage(),
      initialBinding: HomeJsonBinding(),
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
        // Se NÃO está logado, vai para /home-home
        Future.microtask(() => Get.offAllNamed('/home-home'));
        return Container();
      } else {
        // Se está logado, vai para /nav-page
        print("authController.firebaseUser.value");
        print(authController.firebaseUser.value);
        Future.microtask(() => Get.offAllNamed('/nav-page'));
        return Container();
      }
    });
  }
}
