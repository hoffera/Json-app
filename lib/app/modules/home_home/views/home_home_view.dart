import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/components/buttons/primary/primary_button.dart';
import 'package:json_app/app/routes/app_pages.dart';
import 'package:json_app/components/logo/logo_widget.dart';
import '../controllers/home_home_controller.dart';

class HomeHomeView extends GetView<HomeHomeController> {
  const HomeHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),
              const SizedBox(height: 100.0),
              _enterButton(context),
              const SizedBox(height: 20.0),
              _registerButton(context),
            ],
          ),
        ),
      ),
    );
  }

  _enterButton(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
        funds: false,
        color: AppColors.primary,
        textColor: Colors.white,
        text: "Entrar",
        onPressed: () => Get.toNamed(Routes.LOGIN_PAGE),
      ),
    );
  }

  _registerButton(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
        funds: false,
        color: AppColors.primary,
        textColor: Colors.white,
        text: "Cadastre-se agora",
        onPressed: () => Get.toNamed(Routes.REGISTER_PAGE),
      ),
    );
  }
}
