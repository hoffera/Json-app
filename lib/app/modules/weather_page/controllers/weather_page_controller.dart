import 'package:get/get.dart';
import 'package:json_app/app/models/weather_model.dart';
import 'package:json_app/services/weather_service.dart';

class WeatherPageController extends GetxController {
  final WeatherService _weatherService = WeatherService();
  final Rxn<Weather> weather = Rxn<Weather>();

  Future<void> fetchWeather() async {
    try {
      final position = await _weatherService.getCurrentPosition();
      final result = await _weatherService.getWeather(
        position.latitude,
        position.longitude,
      );
      weather.value = result;
    } catch (e) {
      print('Erro ao buscar clima: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }
}
