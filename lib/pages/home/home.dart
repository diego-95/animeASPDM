import 'package:anime_aspdm/models/home_body_type.dart';
import 'package:anime_aspdm/pages/home/components/bodies/anime_body/anime_body.dart';
import 'package:anime_aspdm/pages/home/components/body_select/body_select.dart';
import 'package:anime_aspdm/pages/home/components/top_nav/top_nav.dart';
import 'package:anime_aspdm/providers/provier_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget getHomeBody(ProviderHome provider) {
    return provider.homeBodyType == HomeBodyType.anime
        ? const AnimeBody()
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building $runtimeType");
    return Consumer<ProviderHome>(builder: (context, value, child) {
      return Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            // const BodySelect(),
            getHomeBody(value),
            const TopNav()
          ],
        ),
      );
    });
  }
}
