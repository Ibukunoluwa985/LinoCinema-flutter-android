import 'package:flutter/material.dart';
import 'package:linocinema/ui/cards/explore_search_card.dart';

class ExploreSearch extends SearchDelegate {
  ExploreSearch(this.explores);

  final List explores;
  List suggestionsExplores = [];

  @override
  String get searchFieldLabel => "Search from explore only";

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
    suggestionsExplores = query.isEmpty
        ? explores
        : explores
            .where(
                (explore) => explore.toString().toLowerCase().contains(query))
            .toList();
    return ListView.builder(
      itemCount: suggestionsExplores.length,
      itemBuilder: (context, index) {
        return searchExploresCard(context, suggestionsExplores[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    suggestionsExplores = query.isEmpty
        ? explores
        : explores
            .where(
                (explore) => explore.toString().toLowerCase().contains(query))
            .toList();
    return ListView.builder(
      itemCount: suggestionsExplores.length,
      itemBuilder: (context, index) {
        return searchExploresCard(context, suggestionsExplores[index]);
      },
    );
  }
}
