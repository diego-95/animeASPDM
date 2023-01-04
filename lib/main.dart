import 'package:anime_aspdm/pages/home/home.dart';
import 'package:anime_aspdm/providers/provider_details.dart';
import 'package:anime_aspdm/providers/provier_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// API https://docs.api.jikan.moe/#section/Information
void main() {
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
        ChangeNotifierProvider<ProviderDetails>(
          create: ((context) => ProviderDetails()),
        )
      ],
      child: MaterialApp(
        title: 'Animes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
