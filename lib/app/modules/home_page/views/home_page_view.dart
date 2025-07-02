import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_app/components/background/background_degrade.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Obx(() {
          final weather = controller.weather.value;

          if (weather == null) {
            return const CircularProgressIndicator(color: Colors.red);
          }

          return BackgroundDegrade(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: getWeatherIcon(weather.weatherCode),
                  ),
                  getWeatherDescription(weather.weatherCode),
                  const SizedBox(height: 10),
                  getCity(weather.city),
                  const SizedBox(height: 10),

                  Text(
                    'Temperatura: ${weather.temperatures.first}°C',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  getTemp(10),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget getWeatherDescription(int code) {
    String description;

    switch (code) {
      case == 95 || 96 || 99:
        description = "Trovoadas";
        break;
      case == 51 || 56 || 61 || 66 || 80:
        description = "Chuva leve";
        break;
      case == 55 || 65 || 67 || 81 || 82:
        description = "Chuva forte";
        break;
      case == 56 || 57 || 66 || 67:
        description = "Chuva com gelo";
        break;
      case 0:
        description = "Céu limpo";
        break;
      case == 1 || 2:
        description = "Parcialmente nublado";
        break;
      case 3:
        description = "Nublado";
        break;
      case == 45 || 48:
        description = "Névoa";
        break;
      default:
        description = "Desconhecido";
    }

    return Text(
      description,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white70,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget getCity(String city) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_pin, size: 30, color: Colors.red),
        const SizedBox(width: 5),
        Text(
          'Cidade: $city ',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget getTemp(double temperatura) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('lib/assets/rive/13.png', scale: 8),
        const SizedBox(width: 5),
        Text(
          'Temp Max\n$temperatura °C',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
        ),
        Image.asset('lib/assets/rive/14.png', scale: 8),
        const SizedBox(width: 5),
        Text(
          'Temp Min\n$temperatura °C',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Widget getWeatherIcon(int code) {
    print("code");
    print(code);
    switch (code) {
      case == 95 || 96 || 99:
        return Image.asset('lib/assets/rive/1.png');
      case == 51 || 56 || 61 || 66 || 80:
        return Image.asset('lib/assets/rive/2.png');
      case == 55 || 65 || 67 || 81 || 82:
        return Image.asset('lib/assets/rive/3.png');
      case 56 || 57:
        return Image.asset('lib/assets/rive/4.png');
      case == 0:
        return Image.asset('lib/assets/rive/6.png');
      case == 1 || 2:
        return Image.asset('lib/assets/rive/7.png');
      case == 3:
        return Image.asset('lib/assets/rive/8.png');
      default:
        return Image.asset('lib/assets/rive/7.png');
    }
  }
}
