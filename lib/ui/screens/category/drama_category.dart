import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:linocinema/navigations/transparent_route.dart';
import 'package:linocinema/ui/cards/movies_category_card.dart';
import 'package:linocinema/ui/cards/tvshows_category_card.dart';
import 'package:linocinema/ui/screens/category/all_category.dart';

class DramaCategory extends StatefulWidget {
  DramaCategory(this.movies, this.tvshows);

  // final values
  final List movies;
  final List tvshows;

  @override
  _DramaCategoryState createState() => _DramaCategoryState();
}

class _DramaCategoryState extends State<DramaCategory> {
  getMovieGenre() {
    var movie;
    for (var i = 0; i < widget.movies.length; i++)
      movie = widget.movies
          .where((m) => m['genre'].toString() == 'Drama')
          .toList();
    for (var i = 0; i < widget.movies.length; i++) {
      if (widget.movies[i]['genre'].toString() == 'Drama') {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (((MediaQuery.of(context).size.height) / 7) /
                ((MediaQuery.of(context).size.width) / 2)),
          ),
          itemCount: movie.length,
          itemBuilder: (context, index) {
            return moviesCategoryCard(context, movie[index]);
          },
        );
      }
    }
  }

  getTvshowGenre() {
    var tvshow;
    for (var i = 0; i < widget.tvshows.length; i++)
      tvshow = widget.tvshows
          .where((t) => t['genre'].toString() == 'Drama')
          .toList();
    for (var i = 0; i < widget.tvshows.length; i++) {
      if (widget.tvshows[i]['genre'].toString() == 'Drama') {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (((MediaQuery.of(context).size.height) / 7) /
                ((MediaQuery.of(context).size.width) / 2)),
          ),
          itemCount: tvshow.length,
          itemBuilder: (context, index) {
            return tvshowsCategoryCard(context, tvshow[index]);
          },
        );
      }
    }
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
                      Icon(Icons.category),
                      Text(
                        'Drama',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  actions: [
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
        body: Column(
          children: [
            Text(
              'Movies',
              style: TextStyle(fontSize: 12.0),
            ),
            Expanded(
              child: getMovieGenre() != null
                  ? getMovieGenre()
                  : Center(
                      child: Text(
                      'No Movies with this genre yet!!!',
                      style: TextStyle(fontSize: 12.0),
                    )),
            ),
            Text(
              'Tvshows',
              style: TextStyle(fontSize: 12.0),
            ),
            Expanded(
              child: getTvshowGenre() != null
                  ? getTvshowGenre()
                  : Center(
                      child: Text(
                      'No Tvshows with this genre yet!!!',
                      style: TextStyle(fontSize: 12.0),
                    )),
            ),
          ],
        ));
  }
}
