import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:json_app/app/modules/home_home/views/home_home_view.dart';
import 'package:json_app/app/modules/nav_page/views/nav_page_view.dart';

import 'package:json_app/app/themes/theme_provider.dart';
import 'package:json_app/auth_controller.dart';
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
      home: RouteScreens(),
      getPages: AppPages.routes,
    );
  }
}

class RouteScreens extends StatelessWidget {
  const RouteScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingAlert());
        } else {
          if (snapshot.hasData) {
            // final user =
            //     snapshot.data; // Obtenha o usuário a partir do snapshot
            // _saveUserToken(user); // Chama o método para salvar o token
            return NavPageView();
          } else {
            return const HomeHomeView();
          }
        }
      },
    );
  }

  // // Método separado para salvar o token do usuário
  // Future<void> _saveUserToken(User? user) async {
  //   if (user != null) {
  //     final userId = user.uid; // Obtém o ID do usuário
  //     final tokenServices = TokenServices();
  //     await tokenServices.saveToken(userId); // Armazena o token no Firestore
  //   }
  // }
}
