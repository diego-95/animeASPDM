import 'package:anime_aspdm/drawers/background_drawer.dart';
import 'package:anime_aspdm/models/home_body_type.dart';
import 'package:anime_aspdm/pages/home/components/bodies/anime_body/anime_body.dart';
import 'package:anime_aspdm/pages/home/components/bodies/search_anime_body/search_anime_body.dart';
import 'package:anime_aspdm/pages/home/components/bodies/settings_body/settings_body.dart';
import 'package:anime_aspdm/pages/home/components/bodies/user_body/user_body.dart';
import 'package:anime_aspdm/pages/home/components/top_nav/top_nav.dart';
import 'package:anime_aspdm/providers/provider_home.dart';
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
    Widget newBody;
    switch (provider.homeBodyType) {
      case HomeBodyType.home:
        newBody = const AnimeBody();
        break;
      case HomeBodyType.search:
        newBody = const SearchAnimeBody();
        break;
      case HomeBodyType.settings:
        newBody = const SettingsBody();
        break;
      case HomeBodyType.user:
        newBody = const UserBody();
        break;
    }
    return newBody;
  }

  List<Widget> getStack(ProviderHome provider) {
    return provider.showDrawer
        ? [
            getHomeBody(provider),
            const BackgroundDrawer(),
            const TopNav(),
          ]
        : [getHomeBody(provider), const TopNav()];
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building $runtimeType");
    return Consumer<ProviderHome>(builder: (context, value, child) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: _scaffoldKey,
          body: SafeArea(
            child: Stack(
              children: getStack(value),
            ),
          ),
        ),
      );
    });
  }
}
