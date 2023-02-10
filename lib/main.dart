import 'dart:io';
import 'package:anime_aspdm/models/type_adapters/anime_adapter.dart';
import 'package:anime_aspdm/models/type_adapters/meta_adapter.dart';
import 'package:anime_aspdm/models/type_adapters/user_adapter.dart';
import 'package:anime_aspdm/pages/home/home.dart';
import 'package:anime_aspdm/providers/provider_anime.dart';
import 'package:anime_aspdm/providers/provider_details.dart';
import 'package:anime_aspdm/providers/provider_home.dart';
import 'package:anime_aspdm/providers/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AnimeAdapter());
  Hive.registerAdapter(MetaAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderHome>(
            create: (context) => ProviderHome()),
        ChangeNotifierProvider<ProviderAnime>(
            create: (context) => ProviderAnime()),
        ChangeNotifierProvider<ProviderSearch>(
            create: (context) => ProviderSearch()),
        ChangeNotifierProvider<ProviderDetails>(
          create: ((context) => ProviderDetails()),
        )
      ],
      child: MaterialApp(
        title: 'Animes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Ubuntu"),
        home: const HomePage(),
      ),
    );
  }
}
