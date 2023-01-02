import 'package:anime_aspdm/managers/data_manager.dart';
import 'package:anime_aspdm/providers/provier_home.dart';
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

  _getAiring(ProviderHome provider) async {
    var animes = await dataManager.getTopAiringAnime();
    provider.updateTopAnimeAiring(animes);
  }

  @override
  initState() {
    ProviderHome provider = Provider.of<ProviderHome>(context, listen: false);
    _getAiring(provider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building $runtimeType");
    return Consumer<ProviderHome>(
      builder: (context, value, child) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                  child: Text("Top Anime Airing:",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 290,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.topAnimeAiring.length,
                      itemBuilder: (ctx, i) {
                        var item = value.topAnimeAiring[i];
                        return Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                                width: 150,
                                height: 266,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(.75),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 2))
                                    ],
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(.35),
                                            BlendMode.darken),
                                        image: NetworkImage(item.imageUrl,
                                            scale: 3),
                                        fit: BoxFit.fill,
                                        alignment: Alignment.center)),
                                child: Center(
                                    child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ))),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
