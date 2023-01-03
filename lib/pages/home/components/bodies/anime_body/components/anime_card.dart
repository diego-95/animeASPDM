import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({Key? key, required this.anime}) : super(key: key);

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
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
            child: Center(
                child: Text(
              anime.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ))),
      ),
    );
  }
}
