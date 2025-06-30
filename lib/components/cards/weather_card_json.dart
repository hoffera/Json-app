  import 'package:flutter/material.dart';

  import 'package:json_app/app/enum/enum.dart';
  import 'package:json_dynamic_widget/builders.dart';
  import 'package:lucide_icons/lucide_icons.dart';

  class WeatherCardJson  {
    final String city;
    final String address;
    final String temperature;
    final String apparentTemperature;

    const WeatherCardJson({
      super.key,
      required this.city,
      required this.address,
      required this.temperature,
      required this.apparentTemperature,
    });


      return JsonContainer(
        height: 180,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.backgroundCard,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: AppColors.borderCard, width: 2),
        ),
        child: body(),
        foregroundDecoration: null,
      );
    

    JsonColumn body() {
      return JsonColumn(
        children: [firstLine(), JsonSizedBox(height: 20), secondLine()],
      );
    }

    JsonRow firstLine() {
      return JsonRow(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [tempIcon(), temp(), cityAddress()],
      );
    }

    JsonRow secondLine() {
      return JsonRow(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          card(
            "3.0 nós",
            "SSW",
            const Color(0xFFecfeff),
            LucideIcons.wind,
            const Color(0xFF22bfd9),
          ),
          card(
            "79%",
            "Umidade",
            const Color(0xFFeff6ff),
            LucideIcons.droplets,
            const Color(0xFF4387f6),
          ),
          card(
            "1018",
            "Pressão",
            const Color(0xFFfffbeb),
            LucideIcons.thermometer,
            const Color(0xFFf6ab2b),
          ),
        ],
      );
    }

    JsonIcon tempIcon() {
      return JsonIcon(
        IconData(0xe174, fontFamily: 'MaterialIcons'),
        size: 64,
        color: Colors.black,
      );
    }

    JsonColumn temp() {
      return JsonColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JsonText(
            "$temperature°C",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          JsonText(
            "Sensação térmica: $apparentTemperature°C",
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
          ),
        ],
      );
    }

    JsonColumn cityAddress() {
      return JsonColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          JsonText(
            city,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          JsonText(
            address,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      );
    }

    JsonContainer card(
      String title,
      String subtitle,
      Color backgroundColor,
      IconData icon,
      Color iconColor,
    ) {
      return JsonContainer(
        height: 60,
        width: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: JsonRow(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            JsonIcon(icon, size: 20, weight: 20, color: iconColor),
            JsonSizedBox(width: 10),
            JsonColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                JsonText(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                JsonText(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        foregroundDecoration: null,
      );
    }
  }
