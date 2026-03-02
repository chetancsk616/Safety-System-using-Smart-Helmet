// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'screens/navigation_screen.dart';
import 'services/gps_service.dart';
import 'services/audio_service.dart';
import 'services/wifi_service.dart';
import 'providers/navigation_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Request permissions
  await requestPermissions();

  runApp(MyApp());
}

Future<void> requestPermissions() async {
  await Permission.location.request();
  await Permission.notification.request();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ),

        Provider(
          create: (_) => GPSService(),
        ),

        Provider(
          create: (_) => AudioService(),
        ),

        Provider(
          create: (_) => WiFiService(),
        ),
      ],
      child: MaterialApp(
        title: 'Helmet Navigation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: NavigationScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}