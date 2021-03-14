import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:linocinema/navigations/transparent_route.dart';
import 'package:linocinema/search_delegates/explore_search.dart';
import 'package:linocinema/ui/cards/explore_card.dart';
import 'package:linocinema/ui/screens/category/all_category.dart';

class Home extends StatefulWidget {
  Home(this.explores, this.movies, this.tvshows, this.isLoading,
      this._exploresRefresh);

  // final values
  final List explores;
  final List movies;
  final List tvshows;
  final bool isLoading;
  final _exploresRefresh;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    Image.asset('assets/images/logo.png',
                        width: 30.0, height: 30.0, fit: BoxFit.cover),
                    Text(
                      'LinoCinema',
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
                            delegate: ExploreSearch(widget.explores));
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
      body: widget.explores.contains(null) ||
              widget.explores.length <= 0 ||
              widget.isLoading
          ? RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: widget._exploresRefresh,
              child: Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              )),
            )
          : RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: widget._exploresRefresh,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio:
                      (((MediaQuery.of(context).size.height) / 7) /
                          ((MediaQuery.of(context).size.width) / 2)),
                ),
                itemCount: 3,
                // itemCount: widget.explores.length,
                itemBuilder: (context, index) {
                  return exploreCard(context, widget.explores[index]);
                },
              ),
            ),
    );
  }
}
