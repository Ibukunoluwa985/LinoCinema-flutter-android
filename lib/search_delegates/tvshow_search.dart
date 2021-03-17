import 'package:flutter/material.dart';
import 'package:linocinema/ui/cards/tvshow_search_card.dart';

class TvshowSearch extends SearchDelegate {
  TvshowSearch(this.tvshows);

  final List tvshows;
  List suggestionstvshows = [];

  @override
  String get searchFieldLabel => "Search for tvshow only";

  @override
  TextStyle get searchFieldStyle => TextStyle(fontSize: 14.0);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    suggestionstvshows = query.isEmpty
        ? tvshows
        : tvshows
            .where(
                (explore) => explore.toString().toLowerCase().contains(query))
            .toList();
    return ListView.builder(
      itemCount: suggestionstvshows.length,
      itemBuilder: (context, index) {
        return searchTvshowsCard(context, suggestionstvshows[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    suggestionstvshows = query.isEmpty
        ? tvshows
        : tvshows
            .where(
                (explore) => explore.toString().toLowerCase().contains(query))
            .toList();
    return ListView.builder(
      itemCount: suggestionstvshows.length,
      itemBuilder: (context, index) {
        return searchTvshowsCard(context, suggestionstvshows[index]);
      },
    );
  }
}
