import 'package:jikan_api/jikan_api.dart';

class DataManager {
  final api = Jikan();

  Future<List<Anime>> getTopAiringAnime() async {
    List<Anime> results = [];
    try {
      final topAnime = await api.getTopAnime(subtype: TopSubtype.airing);
      results = topAnime.asList();
    } catch (error) {
      results = [];
    }
    return results;
  }
}
