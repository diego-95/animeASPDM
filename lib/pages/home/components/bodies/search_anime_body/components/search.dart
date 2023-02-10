import 'package:anime_aspdm/providers/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search(
      {Key? key, required this.textEditingController, required this.search})
      : super(key: key);
  final TextEditingController textEditingController;
  final void Function() search;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Widget> getColumnChildren(ProviderSearch provider) {
    List<Widget> result = [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Row(
            children: [
              const Icon(Icons.search),
              const Padding(padding: EdgeInsets.only(right: 5)),
              Expanded(
                child: TextField(
                  onEditingComplete: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    widget.search();
                  },
                  controller: widget.textEditingController,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'Search animes...'),
                ),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              provider.updateSearchOpen(!provider.isSearchOpen);
            },
            constraints: const BoxConstraints(maxHeight: 24, maxWidth: 24),
            padding: EdgeInsets.zero,
            splashRadius: 1,
            icon: const Icon(Icons.filter_alt_rounded))
      ])
    ];
    if (provider.isSearchOpen) {
      result.addAll([
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: DropdownButton(
              items: provider.genres.isNotEmpty
                  ? provider.genres
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ))
                      .toList()
                  : [],
              onChanged: (dynamic value) {
                provider.updateGenre(value);
                widget.search();
              },
              isExpanded: true,
              value: provider.genreSelected,
              menuMaxHeight: 500,
            ),
          ),
        )
      ]);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSearch>(builder: (context, provider, child) {
      return AnimatedContainer(
        height: provider.searchHeight,
        duration: const Duration(milliseconds: 100),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(
              color: Colors.grey.shade200,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(provider.isSearchOpen ? 15 : 30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getColumnChildren(provider),
          ),
        ),
      );
    });
  }
}
