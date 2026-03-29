import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  // Remplacez par votre propre clé API OpenWeatherMap
  final String apiKey = 'VOTRE_CLE_API_ICI';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // Récupération par coordonnées (pour la localisation automatique) [cite: 9, 26]
  Future<Map<String, dynamic>> fetchWeatherByCoords(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=fr'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur lors de la récupération des données météo');
    }
  }

  // Récupération par nom de ville (ville par défaut ou recherche) [cite: 8, 9]
  Future<Map<String, dynamic>> fetchWeatherByCity(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric&lang=fr'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Ville non trouvée');
    }
  }
}