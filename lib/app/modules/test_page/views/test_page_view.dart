import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:json_app/app/modules/test_page/controllers/test_page_controller.dart';
import 'package:json_app/components/buttons/primary/primary_button.dart';
import 'package:json_app/main.dart';
import 'package:json_app/services/render_service.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class TestPageView extends GetView<TestPageController> {
  TestPageView({super.key});

  final jsonData = {
    "type": "column",
    "args": {
      "children": [
        {
          "type": "text",
          "args": {"text": "AnimatedAlign"},
        },
        {
          "type": "linear_graph",
          "args": {"maximum": 100.0, "minimum": 0.0, "value": 75.5},
        },
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = JsonWidgetData.fromDynamic(jsonData, registry: registry);

    //

    return Scaffold(
      appBar: AppBar(title: const Text('LoginPageView'), centerTitle: true),
      body: Center(child: data.build(context: context)),
    );
  }
}
