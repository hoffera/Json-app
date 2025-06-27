import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:json_app/app/models/weather_model.dart';

class WeatherService {
  static const String BASE_URL = 'https://api.open-meteo.com/v1/forecast';

  // Parâmetros fixos para o tipo de dados que queremos
  static const String PARAMETERS = 'hourly=temperature_2m,precipitation';

  Future<Weather?> getWeather(double latitude, double longitude) async {
    final url = Uri.parse(
      '$BASE_URL?latitude=$latitude&longitude=$longitude&$PARAMETERS',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // CONVERTE o JSON para um objeto Weather
        return await Weather.fromJsonWithCity(data);
      } else {
        print('Erro ao buscar clima: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exceção ao buscar clima: $e');
      return null;
    }
  }

  // Função para obter o nome da cidade atual baseado na localização do dispositivo
  Future<Position> getCurrentPosition() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Permissão negada permanentemente');
      }

      // Retorna a posição com precisão alta
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
    } catch (e) {
      print('Erro ao obter posição: $e');
      rethrow;
    }
  }
}
