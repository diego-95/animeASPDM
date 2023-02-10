import 'dart:math';

import 'package:anime_aspdm/models/anime_details_body_type.dart';
import 'package:anime_aspdm/providers/provider_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeDetailsSelect extends StatelessWidget {
  const AnimeDetailsSelect({Key? key}) : super(key: key);

  List<Widget> getRowItems(ProviderDetails provider) {
    List<Widget> result = [];
    for (var element in AnimeDetailsBodyType.values) {
      var name = element.name.substring(0, 1).toUpperCase() +
          element.name.substring(1);
      var selected = provider.animeDetailsBodyType.index == element.index;
      result.add(Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => provider.updateAnimeDetailsBodyType(element),
          child: Container(
              decoration: BoxDecoration(
                  color: selected
                      ? Colors.orange
                      : const Color.fromARGB(255, 233, 233, 233),
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                  boxShadow: selected
                      ? [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: const Offset(0, 1),
                              color: Colors.black.withOpacity(.25))
                        ]
                      : []),
              child: Center(
                  child: Text(
                name,
                style: TextStyle(color: selected ? Colors.white : Colors.black),
              ))),
        ),
      )));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderDetails>(
      builder: ((context, value, child) {
        return Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 233, 233, 233),
            borderRadius: BorderRadius.all(Radius.circular(45)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: getRowItems(value)),
          ),
        );
      }),
    );
  }
}
