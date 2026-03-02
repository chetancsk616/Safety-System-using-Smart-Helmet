import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/audio_service.dart';
import '../providers/navigation_provider.dart';
import '../services/gps_service.dart';
import '../services/wifi_service.dart';
import 'package:location/location.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    final gpsService = Provider.of<GPSService>(context, listen: false);
    final location = await gpsService.getLocation();

    if (!mounted) return;

    setState(() {
      _currentLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioService = Provider.of<AudioService>(context, listen: false);
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HELMET NAVIGATION",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GPS CARD
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.red),
                        SizedBox(width: 8),
                        Text(
                          'GPS TRACKING',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.gps_fixed, size: 16),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _currentLocation == null
                                  ? 'Getting location...'
                                  : 'Lat: ${_currentLocation!.latitude?.toStringAsFixed(6)}\nLng: ${_currentLocation!.longitude?.toStringAsFixed(6)}',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    // GPS Control Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _getCurrentLocation,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Update GPS'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              if (_currentLocation == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('GPS location not available yet'),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                                return;
                              }

                              final wifiService = Provider.of<WiFiService>(context, listen: false);
                              
                              // Show connecting message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Connecting to ESP32...'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                              
                              bool connected = await wifiService.connect();
                              
                              if (connected) {
                                // Format GPS data with proper precision
                                String gpsData = 'GPS,${_currentLocation!.latitude!.toStringAsFixed(6)},${_currentLocation!.longitude!.toStringAsFixed(6)}';
                                
                                // Send the data
                                wifiService.sendMessage(gpsData);
                                
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('✅ Sent: $gpsData'),
                                      backgroundColor: Colors.green,
                                      duration: const Duration(seconds: 3),
                                    ),
                                  );
                                }
                              } else {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('❌ Failed to connect to ESP32'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                            icon: const Icon(Icons.send),
                            label: const Text('Send ESP32'),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // WiFi Connection Status - FIXED: Using isConnected getter
                    Consumer<WiFiService>(
                      builder: (context, wifiService, child) {
                        // FIXED: Using the public isConnected getter instead of private _socket
                        bool isConnected = wifiService.isConnected;
                        
                        return Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isConnected ? Colors.green[50] : Colors.grey[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isConnected ? Colors.green : Colors.grey,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isConnected ? Icons.wifi : Icons.wifi_off,
                                color: isConnected ? Colors.green : Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  isConnected 
                                      ? 'Connected to ESP32 (${wifiService.serverIp}:${wifiService.serverPort})' 
                                      : 'Not connected to ESP32',
                                  style: TextStyle(
                                    color: isConnected ? Colors.green : Colors.grey,
                                  ),
                                ),
                              ),
                              if (isConnected) ...[
                                TextButton(
                                  onPressed: () {
                                    wifiService.disconnect();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Disconnected from ESP32'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  child: const Text('Disconnect'),
                                ),
                              ],
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // NAVIGATION CARD
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.route, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'VOICE NAVIGATION',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    TextField(
                      controller: _fromController,
                      decoration: const InputDecoration(
                        labelText: 'From',
                        hintText: 'Current Location',
                        prefixIcon: Icon(Icons.my_location),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    TextField(
                      controller: _toController,
                      decoration: const InputDecoration(
                        labelText: 'To',
                        hintText: 'Enter destination',
                        prefixIcon: Icon(Icons.location_on),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    Text(
                      navProvider.status,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Navigation Control Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.navigation),
                            label: const Text('START'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            onPressed: () async {
                              if (_toController.text.isEmpty) {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please enter destination'),
                                      backgroundColor: Colors.orange,
                                    ),
                                  );
                                }
                                return;
                              }

                              navProvider.startNavigation();
                              await _getCurrentLocation();

                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('🎧 Navigating to ${_toController.text}'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }

                              // Simulate voice navigation commands
                              await audioService.playVoice('go_straight');
                              await Future.delayed(const Duration(seconds: 2));
                              await audioService.playVoice('turn_left');
                              await Future.delayed(const Duration(seconds: 2));
                              await audioService.playVoice('arrived');
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.stop),
                            label: const Text('STOP'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              navProvider.stopNavigation();
                              audioService.stop();
                              
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Navigation stopped'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}