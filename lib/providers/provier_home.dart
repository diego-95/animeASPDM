import 'package:anime_aspdm/models/home_body_type.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

class ProviderHome extends ChangeNotifier {
  HomeBodyType _homeBodyType = HomeBodyType.anime;
  List<Anime> _topAiringAnime = [];
  List<Anime> _topUpcomingAnime = [];
  List<Anime> _mostPopularAnime = [];
  List<Anime> _seasonAnime = [];

  HomeBodyType get homeBodyType => _homeBodyType;
  List<Anime> get topAiringAnime => _topAiringAnime;
  List<Anime> get topUpcomingAnime => _topUpcomingAnime;
  List<Anime> get mostPopularAnime => _mostPopularAnime;
  List<Anime> get seasonAnime => _seasonAnime;

  updateHomeBodyType(HomeBodyType newValue) {
    _homeBodyType = newValue;
    notifyListeners();
  }

  updateTopAnimeAiring(List<Anime> newValues) {
    _topAiringAnime = newValues;
    notifyListeners();
  }

  updateTopUpcomingAnime(List<Anime> newValues) {
    _topUpcomingAnime = newValues;
    notifyListeners();
  }

  updateMostPopularAnime(List<Anime> newValues) {
    _mostPopularAnime = newValues;
    notifyListeners();
  }

  updateSeasonAnime(List<Anime> newValues) {
    _seasonAnime = newValues;
    notifyListeners();
  }
}
