import 'package:anime_aspdm/models/anime_details_body_type.dart';
import 'package:anime_aspdm/pages/anime_details/components/bodies/components/anime_details_information.dart';
import 'package:anime_aspdm/pages/anime_details/components/bodies/components/anime_details_select.dart';
import 'package:anime_aspdm/providers/provider_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';

class AnimeDetailsBody extends StatefulWidget {
  const AnimeDetailsBody({Key? key, required this.anime, required this.trailer})
      : super(key: key);
  final Anime anime;
  final Widget trailer;
  @override
  State<AnimeDetailsBody> createState() => _AnimeDetailsBodyState();
}

class _AnimeDetailsBodyState extends State<AnimeDetailsBody> {
  String getGenres() {
    return widget.anime.genres.map((p0) => p0.name).join(", ");
  }

  Widget getBody(ProviderDetails provider) {
    switch (provider.animeDetailsBodyType) {
      case AnimeDetailsBodyType.information:
        return AnimeDetailsInformation(anime: widget.anime);
      case AnimeDetailsBodyType.trailer:
        return widget.trailer;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderDetails>(builder: (context, value, child) {
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    SizedBox(
                      width: 128,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: CachedNetworkImage(
                            imageUrl: widget.anime.imageUrl,
                            fit: BoxFit.fill,
                          )),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.anime.titleEnglish ?? widget.anime.title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.anime.titleJapanese ?? widget.anime.title,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(getGenres()),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: AnimeDetailsSelect(),
              ),
              getBody(value)
            ]),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    SizedBox(
                      width: 128,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: CachedNetworkImage(
                            imageUrl: widget.anime.imageUrl,
                            fit: BoxFit.fill,
                          )),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.anime.titleEnglish ?? widget.anime.title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.anime.titleJapanese ?? widget.anime.title,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(getGenres()),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: AnimeDetailsSelect(),
              ),
              getBody(value)
            ]),
          ),
        );
      }
    });
  }
}
