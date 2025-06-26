import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_app/app/routes/app_pages.dart';
import 'package:json_app/components/dialog/show_snackbar.dart';
import 'package:json_app/services/auth_service.dart';
import 'package:json_app/services/token_services.dart'; // ajuste conforme seu projeto

class RegisterPageController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  AuthService authServices = AuthService();
  final formKey = GlobalKey<FormState>();

  void registerUser(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();

    print("name");
    print(name);
    if (formKey.currentState!.validate() && _passwordsMatch()) {
      authServices
          .registerUser(name: name, email: email, password: password)
          .then((error) async {
            if (error == null) {
              final user = FirebaseAuth.instance.currentUser;
              await _saveUserToken(user);

              Get.toNamed(Routes.NAV_PAGE);

              showSnackBar(
                context: context,
                mensagem: "Usuário cadastrado com sucesso!",
                isErro: false,
              );
            } else {
              showSnackBar(
                context: context,
                mensagem: "Verifique seus dados",
                isErro: true,
              );
              print("Erro ao criar a conta: $error");
            }
          });
    } else {
      showSnackBar(
        context: context,
        mensagem: "Senhas não coincidem ou campos inválidos",
        isErro: true,
      );
    }
  }

  bool _passwordsMatch() {
    return passwordController.text == repasswordController.text;
  }

  Future<void> _saveUserToken(User? user) async {
    if (user != null) {
      // final userId = user.uid;
      // final tokenServices = TokenServices();
      // await tokenServices.saveToken(userId);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    super.onClose();
  }
}
