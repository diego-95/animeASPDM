import 'package:anime_aspdm/models/anime_details_body_type.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

class ProviderDetails extends ChangeNotifier {
  Anime? _anime;
  AnimeDetailsBodyType _animeDetailsBodyType = AnimeDetailsBodyType.information;
  late Widget _youtubePlayer;

  Anime? get anime => _anime;
  AnimeDetailsBodyType get animeDetailsBodyType => _animeDetailsBodyType;
  Widget get youtubePlayer => _youtubePlayer;

  updateAnime(Anime newValue) {
    _anime = newValue;
    notifyListeners();
  }

  updateAnimeDetailsBodyType(AnimeDetailsBodyType newValue) {
    _animeDetailsBodyType = newValue;
    notifyListeners();
  }

  updateYoutubPlayer(Widget newValue) {
    _youtubePlayer = newValue;
    notifyListeners();
  }
}
