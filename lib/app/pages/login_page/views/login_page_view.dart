import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/app/routes/app_pages.dart';
import 'package:json_app/components/alert/loading_alert.dart';
import 'package:json_app/components/buttons/primary/primary_button.dart';
import 'package:json_app/components/dialog/reset_password_dialog.dart';
import 'package:json_app/components/dialog/show_snackbar.dart';
import 'package:json_app/components/input/text_input.dart';
import 'package:json_app/components/logo/logo_widget.dart';
import 'package:json_app/components/others/or_widget.dart';
import 'package:mix/mix.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                LogoWidget(),
                const SizedBox(height: 10.0),
                _enterText(),
                const SizedBox(height: 10.0),
                _inputs(),
                const SizedBox(height: 20.0),
                _enterButton(context),
                const SizedBox(height: 10.0),
                _resetPasswordButton(context),
                const Orwidget(color: Colors.white),
                const SizedBox(height: 20.0),
                _registerPageButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _enterText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Entrar",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _inputs() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          _emailInput(),
          const SizedBox(height: 10.0),
          _passwordInput(),
        ],
      ),
    );
  }

  _emailInput() {
    return TextInput(
      off: false,
      password: false,
      text: 'Seu e-mail',
      controller: controller.emailController,
    );
  }

  _passwordInput() {
    return TextInput(
      off: false,
      password: true,
      text: 'Sua senha',
      controller: controller.passwordController,
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
        onPressed: () => controller.loginUser(context),
      ),
    );
  }

  _resetPasswordButton(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: VBox(
        style: Style($box.alignment(Alignment.bottomRight)),
        children: [
          GestureDetector(
            onTap: () {
              showPasswordResetDialog(context);
            },
            child: const Text(
              "Esqueci minha senha",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _registerPageButton(context) {
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
