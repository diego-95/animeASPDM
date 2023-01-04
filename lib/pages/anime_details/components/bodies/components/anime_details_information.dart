import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

class AnimeDetailsInformation extends StatelessWidget {
  const AnimeDetailsInformation({Key? key, required this.anime})
      : super(key: key);
  final Anime anime;

  Widget renderScoreBar() {
    var styleTitle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    var borderColor = const Color.fromARGB(255, 214, 214, 214);
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Score",
                        style: styleTitle,
                      ),
                      Text(anime.score?.toString() ?? "##")
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rank",
                        style: styleTitle,
                      ),
                      Text(anime.rank?.toString() ?? "##")
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Popularity",
                        style: styleTitle,
                      ),
                      Text(anime.popularity?.toString() ?? "##")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            renderScoreBar(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(anime.synopsis ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
