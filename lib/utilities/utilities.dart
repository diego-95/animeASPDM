import 'package:jikan_api/jikan_api.dart';
import 'package:anime_aspdm/models/type_adapters/anime_adapter.dart'
    as HiveAnime;
import 'package:anime_aspdm/models/type_adapters/meta_adapter.dart' as HiveMeta;

List<Anime> mapHiveAnimeToAnime(List<HiveAnime.Anime> source) {
  List<Anime> result = [];
  for (var el in source) {
    result.add(Anime(
      (b) {
        b.aired = el.aired;
        b.airing = el.airing;
        b.duration = el.duration;
        b.episodes = el.episodes;
        b.genres.addAll(el.genres.map((e) => Meta(
              (c) {
                c.malId = e.malId;
                c.name = e.name;
                c.type = e.type;
                c.url = e.url;
              },
            )));
        b.imageUrl = el.imageUrl;
        b.malId = el.malId;
        b.popularity = el.popularity;
        b.rank = el.rank;
        b.rating = el.rating;
        b.score = el.score;
        b.source = el.source;
        b.status = el.status;
        b.synopsis = el.synopsis;
        b.title = el.title;
        b.titleEnglish = el.titleEnglish;
        b.titleJapanese = el.titleJapanese;
        b.trailerUrl = el.trailerUrl;
        b.type = el.type;
        b.url = el.url;
      },
    ));
  }
  return result;
}

List<HiveAnime.Anime> mapAnimeToHiveAnime(List<Anime> source) {
  List<HiveAnime.Anime> result = [];
  for (var el in source) {
    result.add(HiveAnime.Anime(
        aired: el.aired,
        airing: el.airing,
        duration: el.duration,
        episodes: el.episodes,
        genres: el.genres
            .toList()
            .map((e) => HiveMeta.Meta(
                malId: e.malId, name: e.name, type: e.type, url: e.url))
            .toList(),
        imageUrl: el.imageUrl,
        malId: el.malId,
        popularity: el.popularity,
        rank: el.rank,
        rating: el.rating,
        score: el.score,
        source: el.source,
        status: el.status,
        synopsis: el.synopsis,
        title: el.title,
        titleEnglish: el.titleEnglish,
        titleJapanese: el.titleJapanese,
        trailerUrl: el.trailerUrl,
        type: el.type,
        url: el.url));
  }
  return result;
}

Anime mapSingleHiveAnimeToAnime(HiveAnime.Anime el) {
  return Anime(
    (b) {
      b.aired = el.aired;
      b.airing = el.airing;
      b.duration = el.duration;
      b.episodes = el.episodes;
      b.genres.addAll(el.genres.map((e) => Meta(
            (c) {
              c.malId = e.malId;
              c.name = e.name;
              c.type = e.type;
              c.url = e.url;
            },
          )));
      b.imageUrl = el.imageUrl;
      b.malId = el.malId;
      b.popularity = el.popularity;
      b.rank = el.rank;
      b.rating = el.rating;
      b.score = el.score;
      b.source = el.source;
      b.status = el.status;
      b.synopsis = el.synopsis;
      b.title = el.title;
      b.titleEnglish = el.titleEnglish;
      b.titleJapanese = el.titleJapanese;
      b.trailerUrl = el.trailerUrl;
      b.type = el.type;
      b.url = el.url;
    },
  );
}

HiveAnime.Anime mapSingleAnimeToHiveAnime(Anime el) {
  return HiveAnime.Anime(
      aired: el.aired,
      airing: el.airing,
      duration: el.duration,
      episodes: el.episodes,
      genres: el.genres
          .toList()
          .map((e) => HiveMeta.Meta(
              malId: e.malId, name: e.name, type: e.type, url: e.url))
          .toList(),
      imageUrl: el.imageUrl,
      malId: el.malId,
      popularity: el.popularity,
      rank: el.rank,
      rating: el.rating,
      score: el.score,
      source: el.source,
      status: el.status,
      synopsis: el.synopsis,
      title: el.title,
      titleEnglish: el.titleEnglish,
      titleJapanese: el.titleJapanese,
      trailerUrl: el.trailerUrl,
      type: el.type,
      url: el.url);
}
