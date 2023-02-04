import 'package:anime_aspdm/utilities/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:hive/hive.dart';
import 'package:anime_aspdm/models/type_adapters/anime_adapter.dart'
    as HiveAnime;

class DataManager {
  final api = Jikan();

  Future<List<T>> getHiveListData<T, H>(
      String boxName,
      Future<BuiltList<T>> source,
      List<T> Function(List<H> arg) mapperHToT,
      List<H> Function(List<T> arg) mapperTToH,
      [bool forceRefresh = false]) async {
    List<T> results = [];
    bool err = false;
    try {
      var box = await Hive.openBox<H>(boxName);
      if (forceRefresh) {
        try {
          final sourceData = await source;
          results = sourceData.toList();
          box.addAll(mapperTToH(results));
        } catch (error) {
          debugPrint('onErrorLoadingNewData');
          results = [];
          err = true;
        }
      }
      if (!forceRefresh || err) {
        try {
          results = mapperHToT(box.values.toList());
        } catch (error) {
          results = [];
        }
      }
    } catch (error) {
      results = [];
    }
    return results;
  }
  // Future<T> getHiveData<T, H>(
  //     String boxName,
  //     Future<T> source,
  //     T Function(H arg) mapperHToT,
  //     H Function(T arg) mapperTToH,
  //     [bool forceRefresh = false]) async {
  //   T results;
  //   bool err = false;
  //   try {
  //     var box = await Hive.openBox<H>(boxName);
  //     if (forceRefresh) {
  //       try {
  //         final sourceData = await source;
  //         box.add(mapperTToH(sourceData));
  //       } catch (error) {
  //         err = true;
  //       }
  //     }
  //     if (!forceRefresh || err) {
  //       try {
  //         results = mapperHToT(box.get(key));
  //       } catch (error) {
  //         results = [];
  //       }
  //     }
  //   } catch (error) {
  //     results = [];
  //   }
  //   return results;
  // }

  Future<List<Anime>> getTopAiringAnime([bool forceRefresh = false]) async {
    List<Anime> results = [];
    try {
      results = await getHiveListData<Anime, HiveAnime.Anime>(
          'topAiring',
          api.getTopAnime(subtype: TopSubtype.airing),
          mapHiveAnimeToAnime,
          mapAnimeToHiveAnime,
          forceRefresh);
    } catch (error) {
      results = [];
    }
    return results;
  }

  Future<List<Anime>> getSeasonAnime([bool forceRefresh = false]) async {
    List<Anime> results = [];
    try {
      results = await getHiveListData<Anime, HiveAnime.Anime>(
          'season',
          api.getSeason(),
          mapHiveAnimeToAnime,
          mapAnimeToHiveAnime,
          forceRefresh);
    } catch (error) {
      results = [];
    }
    return results;
  }

  Future<List<Anime>> getTopUpcomingAnime([bool forceRefresh = false]) async {
    List<Anime> results = [];
    try {
      results = await getHiveListData<Anime, HiveAnime.Anime>(
          'topUpcoming',
          api.getTopAnime(subtype: TopSubtype.upcoming),
          mapHiveAnimeToAnime,
          mapAnimeToHiveAnime,
          forceRefresh);
    } catch (error) {
      results = [];
    }
    return results;
  }

  Future<List<Anime>> getMostPopularAnime([bool forceRefresh = false]) async {
    List<Anime> results = [];
    try {
      results = await getHiveListData<Anime, HiveAnime.Anime>(
          'mostPopular',
          api.getTopAnime(subtype: TopSubtype.bypopularity),
          mapHiveAnimeToAnime,
          mapAnimeToHiveAnime,
          forceRefresh);
    } catch (error) {
      results = [];
    }
    return results;
  }

  // Future<Anime> getAnimeDetails(int id, [bool forceRefresh = false]) async {
  //   Anime result;
  //   try {
  //     result = await api.getAnime(id);
  //   } finally {}
  //   return result;
  // }

  Future<List<Genre>> getGenres([bool forceRefresh = false]) async {
    List<Genre> result;
    try {
      final genres = await api.getAnimeGenres();
      result = genres.toList();
    } catch (error) {
      result = [];
    }
    return result;
  }

  Future<List<Anime>> searchAnime(String? query, List<int>? genres,
      [bool forceRefresh = false]) async {
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
