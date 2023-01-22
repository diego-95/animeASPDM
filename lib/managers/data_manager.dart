import 'package:jikan_api/jikan_api.dart';

class DataManager {
  final api = Jikan();

  Future<List<Anime>> getTopAiringAnime() async {
    List<Anime> results = [];
    try {
      final topAnimes = await api.getTopAnime(subtype: TopSubtype.airing);
      results = topAnimes.toList();
    } catch (error) {
      results = [];
    }
    return results;
  }

  Future<List<Anime>> getSeasonAnime() async {
    List<Anime> results = [];
    try {
      final seasonAnimes = await api.getSeason();
      results = seasonAnimes.toList();
    } catch (error) {
      results = [];
    }
    return results;
  }

  Future<List<Anime>> getTopUpcomingAnime() async {
    List<Anime> results = [];
    try {
      final topAnimes = await api.getTopAnime(subtype: TopSubtype.upcoming);
      results = topAnimes.toList();
    } catch (error) {
      results = [];
    }
    return results;
  }

  Future<List<Anime>> getMostPopularAnime() async {
    List<Anime> results = [];
    try {
      final topAnimes = await api.getTopAnime(subtype: TopSubtype.bypopularity);
      results = topAnimes.toList();
    } catch (error) {
      results = [];
    }
    return results;
  }

  Future<Anime> getAnimeDetails(int id) async {
    Anime result;
    try {
      result = await api.getAnime(id);
    } finally {}
    return result;
  }

  Future<List<Genre>> getGenres() async {
    List<Genre> result;
    try {
      final genres = await api.getAnimeGenres();
      result = genres.toList();
    } catch (error) {
      result = [];
    }
    return result;
  }

  Future<List<Anime>> searchAnime(String? query, List<int>? genres) async {
    List<Anime> results = [];
    try {
      final topAnimes = await api.searchAnime(query: query, genres: genres);
      results = topAnimes.toList();
    } catch (error) {
      results = [];
    }
    return results;
  }
}
