import 'dart:io';
import 'package:flutter/foundation.dart';

class WiFiService {
  final String _serverIp = '192.168.1.11'; // Change to your ESP32 IP
  final int _serverPort = 8888;
  Socket? _socket;

  // Public getters
  bool get isConnected => _socket != null;
  String get serverIp => _serverIp;
  int get serverPort => _serverPort;

  Future<bool> connect() async {
    try {
      _socket = await Socket.connect(_serverIp, _serverPort);
      debugPrint('✅ Connected to ESP32');
      return true;
    } catch (e) {
      debugPrint('❌ Connection failed: $e');
      return false;
    }
  }

  void sendMessage(String message) {
    if (_socket != null) {
      _socket!.write('$message\n');
      _socket!.flush();
      debugPrint('📤 Sent: $message');
    } else {
      debugPrint('⚠️ Socket not connected');
    }
  }

  void disconnect() {
    _socket?.close();
    _socket = null;
    debugPrint('🔌 Disconnected from ESP32');
  }
}