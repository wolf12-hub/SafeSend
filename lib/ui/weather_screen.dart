import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import '../services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();

  // Variables pour l'affichage (Camouflage) [cite: 8, 20]
  String _temp = "--";
  String _description = "Chargement...";
  String _humidity = "--";
  String _wind = "--";
  String _city = "Localisation...";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initWeather();
  }

  // Initialisation : GPS puis Météo [cite: 26]
  Future<void> _initWeather() async {
    setState(() => _isLoading = true);
    try {
      // 1. Gestion des permissions GPS
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        // 2. Obtenir la position réelle [cite: 26]
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high
        );

        // 3. Appeler l'API avec les coordonnées [cite: 9]
        final data = await _weatherService.fetchWeatherByCoords(
            position.latitude,
            position.longitude
        );
        _updateUI(data);
      } else {
        // Repli sur une ville par défaut si GPS refusé
        final data = await _weatherService.fetchWeatherByCity("Yaoundé");
        _updateUI(data);
      }
    } catch (e) {
      setState(() {
        _description = "Erreur de connexion";
        _isLoading = false;
      });
    }
  }

  void _updateUI(Map<String, dynamic> data) {
    setState(() {
      _temp = "${data['main']['temp'].round()}°";
      _description = data['weather'][0]['description'];
      _humidity = "${data['main']['humidity']}%";
      _wind = "${data['wind']['speed']} km/h";
      _city = data['name'];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF08203E), Color(0xFF557C93)],
          ),
        ),
        child: SafeArea(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator(color: Colors.white))
              : Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 60),
              _buildMainWeather(),
              const Spacer(),
              _buildWeatherDetailsCard(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_city, style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
              Text("Aujourd'hui", style: GoogleFonts.poppins(color: Colors.white70)),
            ],
          ),
          // Bouton actualiser fonctionnel (Camouflage) [cite: 21]
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _initWeather,
          ),
        ],
      ),
    );
  }

  Widget _buildMainWeather() {
    return Column(
      children: [
        const Icon(Icons.wb_cloudy_outlined, size: 100, color: Colors.white),
        const SizedBox(height: 20),
        // Zone du futur Code Secret [cite: 24]
        GestureDetector(
          onTap: () => print("Séquence secrète..."),
          child: Text(
            _temp,
            style: GoogleFonts.poppins(fontSize: 100, fontWeight: FontWeight.w200, color: Colors.white),
          ),
        ),
        Text(
          _description.toUpperCase(),
          style: GoogleFonts.poppins(fontSize: 18, color: Colors.white, letterSpacing: 2),
        ),
      ],
    );
  }

  Widget _buildWeatherDetailsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _infoItem(Icons.water_drop, _humidity, "Humidité"),
          _infoItem(Icons.air, _wind, "Vent"),
          _infoItem(Icons.thermostat, "26°", "Max"),
        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
      ],
    );
  }
}