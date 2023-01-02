import 'package:anime_aspdm/pages/home/components/body_select/body_select.dart';
import 'package:anime_aspdm/pages/home/components/top_nav/top_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
          child: Column(
            children: const [TopNav(), BodySelect()],
          )),
    );
  }
}
