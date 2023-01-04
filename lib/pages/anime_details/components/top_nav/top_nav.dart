import 'package:flutter/material.dart';

class TopNav extends StatelessWidget {
  const TopNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        const Text("Details Anime", style: TextStyle(fontSize: 16)),
        IconButton(
            splashRadius: 20, onPressed: () {}, icon: const Icon(Icons.link))
      ]),
    );
  }
}
