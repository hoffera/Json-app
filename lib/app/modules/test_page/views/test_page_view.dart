import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:json_app/app/modules/test_page/controllers/test_page_controller.dart';
import 'package:json_app/components/cards/weather_card.dart';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class TestPageView extends GetView<TestPageController> {
  const TestPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: WeatherCard()),
      ),
    );
  }
}
