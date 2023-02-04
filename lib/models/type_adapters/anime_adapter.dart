import 'package:anime_aspdm/models/type_adapters/meta_adapter.dart';
import 'package:hive/hive.dart';

part 'anime_adapter.g.dart';

@HiveType(typeId: 2)
class Anime {
  @HiveField(0)
  final int malId;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final String? trailerUrl;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final String? titleEnglish;
  @HiveField(6)
  final String? titleJapanese;
  @HiveField(7)
  final String? type;
  @HiveField(8)
  final String? source;
  @HiveField(9)
  final int? episodes;
  @HiveField(10)
  final String? status;
  @HiveField(11)
  final bool airing;
  @HiveField(12)
  final String? aired;
  @HiveField(13)
  final String? duration;
  @HiveField(14)
  final String? rating;
  @HiveField(15)
  final double? score;
  @HiveField(16)
  final int? rank;
  @HiveField(17)
  final int? popularity;
  @HiveField(18)
  final String? synopsis;
  @HiveField(19)
  final List<Meta> genres;

  Anime(
      {required this.malId,
      required this.url,
      required this.imageUrl,
      required this.trailerUrl,
      required this.title,
      required this.titleEnglish,
      required this.titleJapanese,
      required this.type,
      required this.source,
      required this.episodes,
      required this.status,
      required this.airing,
      required this.aired,
      required this.duration,
      required this.rating,
      required this.score,
      required this.rank,
      required this.popularity,
      required this.synopsis,
      required this.genres});
}
