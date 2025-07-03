// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_app/app/routes/app_pages.dart';
import 'package:json_app/components/alert/loading_alert.dart';
import 'package:json_app/components/dialog/show_snackbar.dart';
import 'package:json_app/services/auth_service.dart';

class LoginPageController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AuthService authServices = AuthService();
  final formKey = GlobalKey<FormState>();

  void loginUser(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible:
            false, // Impedir que o diálogo seja fechado ao tocar fora dele
        builder: (BuildContext context) {
          return const LoadingAlert();
        },
      );
      authServices.loginUser(email: email, password: password).then((error) {
        Navigator.pop(context);
        if (error == null) {
          Get.toNamed(Routes.NAV_PAGE);
          showSnackBar(
            context: context,
            mensagem: "Logado com sucesso!",
            isErro: false,
          );
        } else {
          showSnackBar(
            context: context,
            mensagem: "Verifique seus dados",
            isErro: true,
          );
        }
      });
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
