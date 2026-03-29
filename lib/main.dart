import 'package:flutter/material.dart';
import 'ui/weather_screen.dart'; // Import de votre écran de camouflage

void main() {
  runApp(const SafeSendApp());
}

class SafeSendApp extends StatelessWidget {
  const SafeSendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather', // Nom discret pour le gestionnaire de tâches
      debugShowCheckedModeBanner: false, // Enlever la bannière "Debug" pour plus de réalisme
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // L'application démarre directement sur l'interface météo
      home: const WeatherScreen(),
    );
  }
}