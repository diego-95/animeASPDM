// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  final int typeId = 2;

  @override
  Anime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Anime(
      malId: fields[0] as int,
      url: fields[1] as String,
      imageUrl: fields[2] as String,
      trailerUrl: fields[3] as String?,
      title: fields[4] as String,
      titleEnglish: fields[5] as String?,
      titleJapanese: fields[6] as String?,
      type: fields[7] as String?,
      source: fields[8] as String?,
      episodes: fields[9] as int?,
      status: fields[10] as String?,
      airing: fields[11] as bool,
      aired: fields[12] as String?,
      duration: fields[13] as String?,
      rating: fields[14] as String?,
      score: fields[15] as double?,
      rank: fields[16] as int?,
      popularity: fields[17] as int?,
      synopsis: fields[18] as String?,
      genres: (fields[19] as List).cast<Meta>(),
    );
  }

  @override
  void write(BinaryWriter writer, Anime obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.malId)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.trailerUrl)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.titleEnglish)
      ..writeByte(6)
      ..write(obj.titleJapanese)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.source)
      ..writeByte(9)
      ..write(obj.episodes)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.airing)
      ..writeByte(12)
      ..write(obj.aired)
      ..writeByte(13)
      ..write(obj.duration)
      ..writeByte(14)
      ..write(obj.rating)
      ..writeByte(15)
      ..write(obj.score)
      ..writeByte(16)
      ..write(obj.rank)
      ..writeByte(17)
      ..write(obj.popularity)
      ..writeByte(18)
      ..write(obj.synopsis)
      ..writeByte(19)
      ..write(obj.genres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
