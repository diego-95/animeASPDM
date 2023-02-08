import 'package:anime_aspdm/models/home_body_type.dart';
import 'package:anime_aspdm/pages/home/components/top_nav/drawer_row.dart';
import 'package:anime_aspdm/providers/provider_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopNav extends StatefulWidget {
  const TopNav({Key? key}) : super(key: key);

  @override
  State<TopNav> createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
  Widget getFirstRow(ProviderHome provider) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      const Icon(
        Icons.account_circle,
        color: Colors.orange,
        size: 34,
      ),
      const Text("Hi Friend, welcome back!", style: TextStyle(fontSize: 16)),
      IconButton(
        splashRadius: 24,
        constraints: const BoxConstraints(maxHeight: 24, maxWidth: 24),
        padding: const EdgeInsets.all(0),
        icon: Icon(provider.showDrawer ? Icons.close : Icons.menu),
        onPressed: () {
          provider.updateShowDrawer(!provider.showDrawer);
        },
      )
    ]);
  }

  List<Widget> getColumnChildren(ProviderHome provider) {
    return provider.showDrawer
        ? [
            getFirstRow(provider),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  indent: 5,
                  endIndent: 5,
                  height: 5,
                  thickness: 1,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DrawerRow(
                    text: "Home",
                    icon: Icons.home,
                    selected: provider.homeBodyType == HomeBodyType.home,
                    onTap: () => provider.updateHomeBodyType(HomeBodyType.home),
                  ),
                  DrawerRow(
                      text: "Search Anime",
                      icon: Icons.search,
                      selected: provider.homeBodyType == HomeBodyType.search,
                      onTap: () =>
                          provider.updateHomeBodyType(HomeBodyType.search))
                ],
              ),
            )
          ]
        : [getFirstRow(provider)];
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building $runtimeType");
    return Consumer<ProviderHome>(builder: (context, provider, child) {
      return Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 40, bottom: 40),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: provider.drawerHeight,
          decoration: BoxDecoration(
              color: provider.showDrawer
                  ? Colors.white.withOpacity(.85)
                  : Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 5))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: getColumnChildren(provider),
            ),
          ),
        ),
      );
    });
  }
}
