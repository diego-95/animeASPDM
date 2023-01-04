import 'package:anime_aspdm/pages/home/components/bodies/anime_body/components/anime_card.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({Key? key, required this.animes}) : super(key: key);

  final List<Anime> animes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: animes.length,
          itemBuilder: (ctx, i) {
            var item = animes[i];
            return Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: AnimeCard(anime: item),
            ));
          }),
    );
  }
}
