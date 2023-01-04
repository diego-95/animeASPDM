import 'package:anime_aspdm/pages/anime_details/components/bodies/anime_details_body.dart';
import 'package:anime_aspdm/pages/anime_details/components/top_nav/top_nav.dart';
import 'package:anime_aspdm/providers/provider_details.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';

class AnimeDetails extends StatefulWidget {
  const AnimeDetails({Key? key, required this.anime}) : super(key: key);

  final Anime anime;

  @override
  State<AnimeDetails> createState() => _AnimeDetailsState();
}

class _AnimeDetailsState extends State<AnimeDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderDetails>(
      builder: (context, value, child) {
        return Scaffold(
          body: Column(children: [
            const TopNav(),
            Expanded(
              child: AnimeDetailsBody(
                anime: widget.anime,
              ),
            )
          ]),
        );
      },
    );
  }
}
