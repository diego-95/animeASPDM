import 'package:anime_aspdm/models/anime_details_body_type.dart';
import 'package:anime_aspdm/pages/anime_details/components/bodies/anime_details_body.dart';
import 'package:anime_aspdm/pages/anime_details/components/top_nav/top_nav.dart';
import 'package:anime_aspdm/providers/provider_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AnimeDetails extends StatefulWidget {
  const AnimeDetails({Key? key, required this.anime}) : super(key: key);

  final Anime anime;

  @override
  State<AnimeDetails> createState() => _AnimeDetailsState();
}

class _AnimeDetailsState extends State<AnimeDetails> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    String id = widget.anime.trailerUrl != null
        ? YoutubePlayer.convertUrlToId(widget.anime.trailerUrl.toString())
            .toString()
        : "";
    _controller = YoutubePlayerController(
        initialVideoId: id, flags: const YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getBody(Widget? player, BuildContext context) {
    Widget trailerWidget;
    if (widget.anime.trailerUrl != null) {
      trailerWidget = Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: player),
      );
    } else {
      trailerWidget =
          (const Expanded(child: Center(child: Text("No trailer available"))));
    }
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Column(children: [
        const TopNav(),
        Expanded(
          child: AnimeDetailsBody(anime: widget.anime, trailer: trailerWidget),
        )
      ]);
    } else {
      return Column(children: [
        const TopNav(),
        Expanded(
          child: SingleChildScrollView(
              child: AnimeDetailsBody(
                  anime: widget.anime, trailer: trailerWidget)),
        )
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderDetails>(builder: (context, value, child) {
      return Scaffold(
          body: value.animeDetailsBodyType == AnimeDetailsBodyType.trailer
              ? YoutubePlayerBuilder(
                  onExitFullScreen: () {
                    debugPrint("Exit Full Screen");
                    SystemChrome.setPreferredOrientations(
                        DeviceOrientation.values);
                  },
                  player: YoutubePlayer(
                    controller: _controller,
                  ),
                  builder: (context, player) {
                    return getBody(player, context);
                  })
              : getBody(null, context));
    });
  }
}
