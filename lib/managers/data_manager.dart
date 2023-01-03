import 'package:jikan_api/jikan_api.dart';

class DataManager {
  final api = Jikan();

  Future<List<Anime>> getTopAiringAnime() async {
    List<Anime> results = [];
    try {
      final topAnimes = await api.getTopAnime(subtype: TopSubtype.airing);
      results = topAnimes.asList();
    } catch (error) {
      results = [];
    }
    return results;
  }

  Future<List<Anime>> getSeasonAnime() async {
    List<Anime> results = [];
    try {
      final seasonAnimes = await api.getSeason();
      results = seasonAnimes.asList();
    } catch (error) {
      results = [];
    }
    return results;
  }

  Future<List<Anime>> getTopUpcomingAnime() async {
    List<Anime> results = [];
    try {
      final topAnimes = await api.getTopAnime(subtype: TopSubtype.upcoming);
      results = topAnimes.asList();
    } catch (error) {
      results = [];
    }
    return results;
  }

  Future<List<Anime>> getMostPopularAnime() async {
    List<Anime> results = [];
    try {
      final topAnimes = await api.getTopAnime(subtype: TopSubtype.bypopularity);
      results = topAnimes.asList();
    } catch (error) {
      results = [];
    }
    return results;
  }
}
