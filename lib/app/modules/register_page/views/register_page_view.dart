import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/components/buttons/primary/primary_button.dart';
import 'package:json_app/components/input/text_input.dart';
import '../controllers/register_page_controller.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  final _formKey = GlobalKey<FormState>();

  RegisterPageView({super.key});
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
                _titleText(),
                _subtitleText(),
                const SizedBox(height: 10.0),
                _inputs(),
                const SizedBox(height: 30.0),
                _registerButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _titleText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Cadastrar",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _subtitleText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Crie seu perfil",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  _inputText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
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
          _nameInput(),
          const SizedBox(height: 10.0),
          _emailInput(),
          const SizedBox(height: 10.0),
          _passwordInput(),
          const SizedBox(height: 10.0),
          _repasswordInput(),
        ],
      ),
    );
  }

  _nameInput() {
    return Column(
      children: [
        _inputText("Nome completo"),
        const SizedBox(height: 10.0),
        TextInput(
          off: false,
          password: false,
          name: true,
          text: 'Nome completo',
          controller: controller.nameController,
        ),
      ],
    );
  }

  _emailInput() {
    return Column(
      children: [
        _inputText("E-mail"),
        const SizedBox(height: 10.0),
        TextInput(
          off: false,
          email: true,
          password: false,
          text: 'E-mail',
          controller: controller.emailController,
        ),
      ],
    );
  }

  _passwordInput() {
    return Column(
      children: [
        _inputText("Senha"),
        const SizedBox(height: 10.0),
        TextInput(
          off: false,
          password: true,
          text: '*********',
          controller: controller.passwordController,
        ),
      ],
    );
  }

  _repasswordInput() {
    return Column(
      children: [
        _inputText("Repita sua senha"),
        const SizedBox(height: 10.0),
        TextInput(
          off: false,
          password: true,
          text: '*********',
          controller: controller.repasswordController,
        ),
      ],
    );
  }

  _registerButton(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
        funds: false,
        color: AppColors.primary,
        textColor: Colors.white,
        text: "Cadastrar",
        onPressed: () => controller.registerUser(context),
      ),
    );
  }
}
