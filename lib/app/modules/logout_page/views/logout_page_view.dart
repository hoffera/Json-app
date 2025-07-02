import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/app/routes/app_pages.dart';
import 'package:json_app/components/buttons/primary/primary_button.dart';
import 'package:json_app/services/auth_service.dart';

import '../controllers/logout_page_controller.dart';

class LogoutPageView extends GetView<LogoutPageController> {
  const LogoutPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const SizedBox(height: 100.0), _logoutButton(context)],
          ),
        ),
      ),
    );
  }

  _logoutButton(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
        funds: false,
        color: Colors.red,
        textColor: Colors.white,
        text: "Sair",
        onPressed: () {
          AuthService().deslogar().then((error) {
            if (error == null) {
              Navigator.pushNamed(context, '/home-home');
            }
          });
        },
      ),
    );
  }
}
