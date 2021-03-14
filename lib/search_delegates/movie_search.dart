import 'package:flutter/material.dart';
import 'package:linocinema/ui/cards/movie_search_card.dart';

class MovieSearch extends SearchDelegate {
  MovieSearch(this.movies);

  final List movies;
  List suggestionsMovies = [];

  @override
  String get searchFieldLabel => "Search for movie only";

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
    suggestionsMovies = query.isEmpty
        ? movies
        : movies
            .where(
                (explore) => explore.toString().toLowerCase().contains(query))
            .toList();
    return ListView.builder(
      itemCount: suggestionsMovies.length,
      itemBuilder: (context, index) {
        return searchMoviesCard(context, suggestionsMovies[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    suggestionsMovies = query.isEmpty
        ? movies
        : movies
            .where(
                (explore) => explore.toString().toLowerCase().contains(query))
            .toList();
    return ListView.builder(
      itemCount: suggestionsMovies.length,
      itemBuilder: (context, index) {
        return searchMoviesCard(context, suggestionsMovies[index]);
      },
    );
  }
}
