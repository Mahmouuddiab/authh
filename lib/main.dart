import 'package:authh/core/di/di.dart';
import 'package:authh/features/weather/presentation/pages/weather_screen.dart';
import 'package:authh/observe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observe();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

