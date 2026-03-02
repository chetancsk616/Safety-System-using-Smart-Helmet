import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  String _status = "IDLE";
  
  String get status => _status;
  
  void startNavigation() {
    _status = "NAVIGATING";
    notifyListeners();
  }
  
  void stopNavigation() {
    _status = "IDLE";
    notifyListeners();
  }
}
