import 'package:flutter/foundation.dart';
import 'package:location/location.dart';

class GPSService {
  final Location _location = Location();
  LocationData? _currentLocation;

  Future<LocationData?> getLocation() async {
    try {
      // Check if GPS is enabled
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          debugPrint('GPS service not enabled');
          return null;
        }
      }

      // Check permission
      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          debugPrint('GPS permission denied');
          return null;
        }
      }

      // Get location
      _currentLocation = await _location.getLocation();
      debugPrint('📍 GPS: ${_currentLocation?.latitude}, ${_currentLocation?.longitude}');
      return _currentLocation;
      
    } catch (e) {
      debugPrint('GPS Error: $e');
      return null;
    }
  }

  // Format for ESP32
  String getFormattedData() {
    if (_currentLocation != null) {
      return 'GPS,${_currentLocation!.latitude},${_currentLocation!.longitude}';
    }
    return 'GPS,0.0,0.0';
  }
}
