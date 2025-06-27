import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mix/mix.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({super.key});

  final style = Style(
    $box.height(180),
    $box.width(double.infinity),
    $box.padding.all(10),
    $box.color(AppColors.backgroundCard),
    $box.borderRadius.all(10.0),
    $box.shadow(
      color: Colors.black26,
      blurRadius: 5,
      spreadRadius: 2,
      offset: Offset(0, 4),
    ),
    $box.border(
      color: AppColors.borderCard,
      width: 2,
      style: BorderStyle.solid,
      strokeAlign: 0.5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Box(style: style, child: body());
  }

  Widget body() {
    return Column(children: [fistLine(), SizedBox(height: 20), secondLine()]);
  }

  Widget fistLine() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [tempIcon(), temperature(), city()],
    );
  }

  Widget secondLine() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        card(
          "3.0 nós",
          "SSW",
          Color(0xFFecfeff),
          LucideIcons.wind,
          Color(0xFF22bfd9),
        ),
        card(
          "79%",
          "Umidade",
          Color(0xFFeff6ff),
          LucideIcons.droplets,
          Color(0xFF4387f6),
        ),
        card(
          "1018",
          "Pressão",
          Color(0xFFfffbeb),
          LucideIcons.thermometer,
          Color(0xFFf6ab2b),
        ),
      ],
    );
  }

  Widget tempIcon() {
    return SvgPicture.asset(
      'lib/assets/images/cloud-icon.svg',
      width: 64,
      height: 64,
    );
  }

  Widget temperature() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(
          "17°C",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Text(
          "Sensação térmica: 18°C",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget city() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      children: [
        Text(
          "Paranaguá",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        Text(
          "Portos do Paraná",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget card(
    String title,
    String subtitle,
    Color backgroundColor,
    IconData icon,
    Color iconColor,
  ) {
    final styleCard = Style(
      $box.height(60),
      $box.width(100),
      $box.padding.all(10),
      $box.color(backgroundColor),
      $box.borderRadius.all(10.0),
      $box.shadow(
        color: Colors.black.withValues(alpha: 0.2), // sombra mais leve
        blurRadius: 10,
        spreadRadius: 0,
        offset: Offset(0, 2),
      ),
    );

    return Box(
      style: styleCard,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, size: 20, weight: 20, color: iconColor),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
