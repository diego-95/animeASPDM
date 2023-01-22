import 'package:anime_aspdm/managers/data_manager.dart';
import 'package:anime_aspdm/pages/home/components/bodies/search_anime_body/components/search.dart';
import 'package:anime_aspdm/pages/home/components/bodies/search_anime_body/components/search_result.dart';
import 'package:anime_aspdm/providers/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAnimeBody extends StatefulWidget {
  const SearchAnimeBody({Key? key}) : super(key: key);

  @override
  State<SearchAnimeBody> createState() => _SearchAnimeBodyState();
}

class _SearchAnimeBodyState extends State<SearchAnimeBody> {
  DataManager dataManager = DataManager();
  TextEditingController searchEditor = TextEditingController();
  _getGenres(ProviderSearch provider) async {
    var genres = await dataManager.getGenres();
    provider.updateGenres(genres);
  }

  void _searchAnime(ProviderSearch provider) async {
    List<int> genres = [];
    if (provider.genreSelected.malId != -1) {
      genres.add(provider.genreSelected.malId);
    }
    var animes = await dataManager.searchAnime(searchEditor.text, genres);
    provider.updateAnimes(animes);
  }

  @override
  void initState() {
    ProviderSearch provider =
        Provider.of<ProviderSearch>(context, listen: false);
    _getGenres(provider);
    _searchAnime(provider);
    super.initState();
  }

  List<Widget> renderResults(ProviderSearch provider) {
    return provider.animes.map((e) => SearchResult(anime: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSearch>(builder: (builder, provider, child) {
      return SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 100),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Search(
                textEditingController: searchEditor,
                search: () => _searchAnime(provider)),
          ),
          ...renderResults(provider)
        ]),
      );
    });
  }
}
