import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:anime_aspdm/utilities/constants.dart';

class ProviderSearch extends ChangeNotifier {
  List<Genre> _genres = [];
  Genre _genreSelected = noGenre;
  double _searchHeight = 50;
  bool _isSearchOpen = false;
  List<Anime> _animes = [];

  List<Genre> get genres => _genres;
  Genre get genreSelected => _genreSelected;
  double get searchHeight => _searchHeight;
  bool get isSearchOpen => _isSearchOpen;
  List<Anime> get animes => _animes;

  updateGenres(List<Genre> newValues) {
    _genres = newValues;
    _genres.insert(0, noGenre);
    notifyListeners();
  }

  updateGenre(Genre newValue) {
    _genreSelected = newValue;
    notifyListeners();
  }

  updateSearchOpen(bool newValue) {
    _isSearchOpen = newValue;
    _searchHeight = newValue ? 110 : 50;
    notifyListeners();
  }

  updateAnimes(List<Anime> newValues) {
    _animes = newValues;
    notifyListeners();
  }
}
