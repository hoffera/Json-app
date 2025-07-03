import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:json_app/app/models/chart_model.dart';

class ChartService {
  static Future<Chart?> fetchDados(String chartId) async {
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final response = await http.get(
      url,
      headers: {
        'accept': '*/*',
        'app-version': '2.1',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      final chart = chartFromJson(response.body);
      return chart;
    } else {
      throw Exception('Erro ao buscar dados: ${response.statusCode}');
    }
  }
}
