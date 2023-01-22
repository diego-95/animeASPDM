import 'package:anime_aspdm/models/anime_details_body_type.dart';
import 'package:anime_aspdm/pages/anime_details/anime_details.dart';
import 'package:anime_aspdm/providers/provider_details.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.anime}) : super(key: key);
  final Anime anime;

  void openDetails(BuildContext context) {
    Provider.of<ProviderDetails>(context, listen: false)
        .updateAnimeDetailsBodyType(AnimeDetailsBodyType.information);
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => AnimeDetails(anime: anime))));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => openDetails(context),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2))
              ],
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: SizedBox(
            height: 250,
            child: Row(
              children: [
                Container(
                  width: 160,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(13),
                          bottomLeft: Radius.circular(13)),
                      image: DecorationImage(
                          image: NetworkImage(anime.imageUrl),
                          fit: BoxFit.fill)),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          anime.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(anime.type != null ? anime.type! : ""),
                        Text(anime.score != null
                            ? "Score: ${anime.score!.toString()}"
                            : "Score: #"),
                        Text(anime.popularity != null
                            ? "Popularity: ${anime.popularity!.toString()}"
                            : "Popularity: #"),
                        Text(anime.genres.map((p0) => p0.name).join(", ")),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
