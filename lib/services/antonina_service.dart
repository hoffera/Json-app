import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_app/app/models/antonina_model.dart';

class AntoninaService {
  static Future<Antonina?> fetchDados() async {
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
      final antonina = antoninaFromJson(response.body);
      return antonina;
    } else {
      throw Exception('Erro ao buscar dados: ${response.statusCode}');
    }
  }
}
