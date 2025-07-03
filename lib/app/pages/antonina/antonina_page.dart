import 'package:flutter/material.dart';
import 'package:json_app/app/models/antonina_model.dart';
import 'package:json_app/app/models/chart_model.dart';
import 'package:json_app/services/antonina_service.dart';
import 'package:json_app/services/chart_service.dart';

class AntoninaPage extends StatelessWidget {
  const AntoninaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SubDescription')),
      body: FutureBuilder<Chart?>(
        future: ChartService.fetchDados("1885"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Nenhum dado encontrado.'));
          }

          final chart = snapshot.data!;
          return Center(
            child: Text(
              chart.subDescription!,
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
