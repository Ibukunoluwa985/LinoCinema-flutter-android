import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:linocinema/navigations/transparent_route.dart';
import 'package:linocinema/search_delegates/tvshow_search.dart';
import 'package:linocinema/ui/cards/tvshow_card.dart';
import 'package:linocinema/ui/screens/category/all_category.dart';

class Tvshows extends StatefulWidget {
  Tvshows(this.tvshows, this.movies, this.isLoading, this._tvshowsRefresh);

  // final values
  final List tvshows;
  final List movies;
  final bool isLoading;
  final _tvshowsRefresh;

  @override
  _TvshowsState createState() => _TvshowsState();
}

class _TvshowsState extends State<Tvshows> {
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
                    Icon(Icons.tv),
                    Text(
                      'Tvshows',
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
                            delegate: TvshowSearch(widget.tvshows));
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
      body: widget.tvshows.contains(null) ||
              widget.tvshows.length <= 0 ||
              widget.isLoading
          ? RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: widget._tvshowsRefresh,
              child: Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              )),
            )
          : RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: widget._tvshowsRefresh,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio:
                      (((MediaQuery.of(context).size.height) / 7) /
                          ((MediaQuery.of(context).size.width) / 2)),
                ),
                itemCount: 3,
                // itemCount: widget.tvshows.length,
                itemBuilder: (context, index) {
                  return tvshowsCard(context, widget.tvshows[index]);
                },
              ),
            ),
    );
  }
}
