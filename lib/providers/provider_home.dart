import 'package:anime_aspdm/models/home_body_type.dart';
import 'package:flutter/material.dart';

class ProviderHome extends ChangeNotifier {
  HomeBodyType _homeBodyType = HomeBodyType.home;
  bool _showDrawer = false;
  double _drawerHeight = 50;

  HomeBodyType get homeBodyType => _homeBodyType;
  bool get showDrawer => _showDrawer;
  double get drawerHeight => _drawerHeight;

  updateHomeBodyType(HomeBodyType newValue) {
    _homeBodyType = newValue;
    updateShowDrawer(false);
  }

  updateShowDrawer(bool newValue) {
    _showDrawer = newValue;
    _drawerHeight = newValue ? 180 : 50;
    notifyListeners();
  }
}
