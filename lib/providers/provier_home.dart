import 'package:anime_aspdm/models/home_body_type.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

class ProviderHome extends ChangeNotifier {
  HomeBodyType _homeBodyType = HomeBodyType.anime;
  List<Anime> _topAnimeAiring = [];

  HomeBodyType get homeBodyType => _homeBodyType;
  List<Anime> get topAnimeAiring => _topAnimeAiring;

  updateHomeBodyType(HomeBodyType newValue) {
    _homeBodyType = newValue;
    notifyListeners();
  }

  updateTopAnimeAiring(List<Anime> newValues) {
    _topAnimeAiring = newValues;
    notifyListeners();
  }
}
