import 'package:flutter/material.dart';
import 'package:json_app/app/enum/enum.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key});

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _logo();
  }

  _logoImage() {
    return SizedBox(
      width: 450, // Defina a largura desejada
      height: 450, // Defina a altura desejada
      child: Image.asset('lib/assets/rive/1.png'),
    );
  }

  _logo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SizedBox(
        height: 200,
        child: Container(
          width: double.infinity,
          color: AppColors.primary,
          child: Center(child: _logoImage()),
        ),
      ),
    );
  }
}
