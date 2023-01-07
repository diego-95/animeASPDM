import 'package:anime_aspdm/models/anime_details_body_type.dart';
import 'package:anime_aspdm/pages/anime_details/anime_details.dart';
import 'package:anime_aspdm/providers/provider_details.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({Key? key, required this.anime}) : super(key: key);

  final Anime anime;

  void openDetails(BuildContext context) {
    Provider.of<ProviderDetails>(context, listen: false)
        .updateAnimeDetailsBodyType(AnimeDetailsBodyType.information);
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => AnimeDetails(anime: anime))));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openDetails(context);
      },
      child: Ink(
          width: 150,
          height: 266,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.75),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2))
              ],
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.35), BlendMode.darken),
                  image: NetworkImage(anime.imageUrl),
                  fit: BoxFit.fill,
                  alignment: Alignment.center)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                anime.titleEnglish ?? anime.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ],
          )),
    );
  }
}
