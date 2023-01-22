import 'package:anime_aspdm/managers/data_manager.dart';
import 'package:anime_aspdm/pages/home/components/bodies/anime_body/components/anime_list.dart';
import 'package:anime_aspdm/providers/provider_anime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeBody extends StatefulWidget {
  const AnimeBody({Key? key}) : super(key: key);

  @override
  State<AnimeBody> createState() => _AnimeBodyState();
}

class _AnimeBodyState extends State<AnimeBody> {
  DataManager dataManager = DataManager();

  _getAiring(ProviderAnime provider) async {
    var animes = await dataManager.getTopAiringAnime();
    provider.updateTopAnimeAiring(animes);
  }

  _getUpcoming(ProviderAnime provider) async {
    var animes = await dataManager.getTopUpcomingAnime();
    provider.updateTopUpcomingAnime(animes);
  }

  _getMostPopular(ProviderAnime provider) async {
    var animes = await dataManager.getMostPopularAnime();
    provider.updateMostPopularAnime(animes);
  }

  _getSeason(ProviderAnime provider) async {
    var animes = await dataManager.getSeasonAnime();
    provider.updateSeasonAnime(animes);
  }

  @override
  initState() {
    ProviderAnime provider = Provider.of<ProviderAnime>(context, listen: false);
    _getSeason(provider);
    _getAiring(provider);
    _getUpcoming(provider);
    _getMostPopular(provider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building $runtimeType");
    return Consumer<ProviderAnime>(
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                child: Text("Current Season Anime:",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              AnimeList(animes: value.seasonAnime),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                child: Text("Top Anime Airing:",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              AnimeList(animes: value.topAiringAnime),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                child: Text("Top Upcoming Anime:",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              AnimeList(animes: value.topUpcomingAnime),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                child: Text("Most Popular Anime:",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              AnimeList(animes: value.mostPopularAnime)
            ],
          ),
        );
      },
    );
  }
}
