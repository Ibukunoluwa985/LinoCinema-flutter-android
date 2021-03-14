import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:linocinema/navigations/transparent_route.dart';
import 'package:linocinema/search_delegates/movie_search.dart';
import 'package:linocinema/ui/cards/movie_card.dart';
import 'package:linocinema/ui/screens/category/all_category.dart';

class Movies extends StatefulWidget {
  Movies(this.movies, this.tvshows, this.isLoading, this._moviesRefresh);

  // final values
  final List movies;
  final List tvshows;
  final bool isLoading;
  final _moviesRefresh;

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  // Keys
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 56.0),
        child: Container(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  children: [
                    Icon(Icons.movie),
                    Text(
                      'Movies',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: MovieSearch(widget.movies));
                      }),
                  TextButton(
                      child: Row(
                        children: [
                          Text(
                            'category',
                            style: TextStyle(fontSize: 10.0),
                          ),
                          Icon(Icons.category_sharp),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).push(TransparentRoute(
                            builder: (BuildContext context) =>
                                AllCategory(widget.movies, widget.tvshows)));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
      body: widget.movies.contains(null) ||
              widget.movies.length <= 0 ||
              widget.isLoading
          ? RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: widget._moviesRefresh,
              child: Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              )),
            )
          : RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: widget._moviesRefresh,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio:
                      (((MediaQuery.of(context).size.height) / 7) /
                          ((MediaQuery.of(context).size.width) / 2)),
                ),
                itemCount: widget.movies.length,
                itemBuilder: (context, index) {
                  return moviesCard(context, widget.movies[index]);
                },
              ),
            ),
    );
  }
}
