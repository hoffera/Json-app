import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_app/main.dart'; // onde está o `registry`

class TestPageView extends StatefulWidget {
  const TestPageView({super.key});

  @override
  State<TestPageView> createState() => _TestPageViewState();
}

class _TestPageViewState extends State<TestPageView> {
  Future<JsonWidgetData?> loadJsonWidgetData() async {
    try {
      final jsonStr = await rootBundle.loadString(
        'lib/assets/json/card_automatico.json',
      );
      final jsonMap = json.decode(jsonStr);
      return JsonWidgetData.fromDynamic(jsonMap, registry: registry);
    } catch (e) {
      debugPrint('Erro ao carregar JSON: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder<JsonWidgetData?>(
            future: loadJsonWidgetData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator(color: Colors.red);
              }

              if (snapshot.hasError || snapshot.data == null) {
                return const Text(
                  'Erro ao carregar JSON',
                  style: TextStyle(color: Colors.white),
                );
              }

              return snapshot.data!.build(context: context);
            },
          ),
        ),
      ),
    );
  }
}
