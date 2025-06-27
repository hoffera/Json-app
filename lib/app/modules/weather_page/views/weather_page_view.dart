import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:json_app/main.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import '../controllers/weather_page_controller.dart';

class WeatherPageView extends GetView<WeatherPageController> {
  WeatherPageView({super.key});

  final jsonData = {
    "type": "background_degrade",
    "args": {
      "child": {
        "type": "column",
        "args": {
          "children": [
            {
              "type": "container",
              "args": {
                "height": 200,
                "padding": [16, 8],
                "child": {
                  "type": "asset_image",
                  "args": {"fit": "fitHeight", "name": "lib/assets/rive/1.png"},
                },
              },
            },
            {
              "type": "linear_graph",
              "args": {"maximum": 100, "minimum": 0, "value": 75.5},
            },
          ],
        },
      },
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = JsonWidgetData.fromDynamic(jsonData, registry: registry);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Obx(() {
          final weather = controller.weather.value;

          if (weather == null) {
            return const CircularProgressIndicator(color: Colors.red);
          }
          return data.build(context: context);
        }),
      ),
    );
  }
}
