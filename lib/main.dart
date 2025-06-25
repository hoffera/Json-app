import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_app/app/routes/app_pages.dart';
import 'package:json_app/components/custom_widget_registrar.dart';

final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  registry.navigatorKey = GlobalKey<NavigatorState>();

  CustomWidgetRegistrar.registerDefaults(registry: registry);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: registry.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'JSON App',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
