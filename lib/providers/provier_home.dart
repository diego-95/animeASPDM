import 'package:anime_aspdm/models/home_body_type.dart';
import 'package:flutter/material.dart';

class ProviderHome extends ChangeNotifier {
  HomeBodyType _homeBodyType = HomeBodyType.anime;

  HomeBodyType get homeBodyType => _homeBodyType;

  updateHomeBodyType(HomeBodyType newValue) {
    _homeBodyType = newValue;
    notifyListeners();
  }
}
