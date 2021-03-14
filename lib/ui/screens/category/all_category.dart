import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:linocinema/ui/screens/category/action_category.dart';
import 'package:linocinema/ui/screens/category/animation_category.dart';
import 'package:linocinema/ui/screens/category/comedy_category.dart';
import 'package:linocinema/ui/screens/category/crime_category.dart';
import 'package:linocinema/ui/screens/category/documentary_category.dart';
import 'package:linocinema/ui/screens/category/drama_category.dart';
import 'package:linocinema/ui/screens/category/family_category.dart';
import 'package:linocinema/ui/screens/category/horror_category.dart';
import 'package:linocinema/ui/screens/category/romantic_category.dart';
import 'package:linocinema/ui/screens/category/sci-fi_category.dart';
import 'package:page_transition/page_transition.dart';

class AllCategory extends StatefulWidget {
  AllCategory(this.movies, this.tvshows);

  // final values
  final List movies;
  final List tvshows;

  @override
  _AllCategoryState createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  List movies;
  List tvshows;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    tvshows = widget.tvshows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.clear),
        ),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: ActionCategory(movies, tvshows)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Text('Action'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: AnimationCategory(movies, tvshows)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Text('Animation'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: CrimeCategory(movies, tvshows)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Text('Crime'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: ComedyCategory(movies, tvshows)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Text('Comedy'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: DramaCategory(movies, tvshows)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Text('Drama'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: DocumentaryCategory(movies, tvshows)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Text('Documentary'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: FamilyCategory(movies, tvshows)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Text('Family'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: HorrorCategory(movies, tvshows)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Text('Horror'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: RomanticCategory(movies, tvshows)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Text('Romantic'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: SciFiCategory(movies, tvshows)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Text('Sci-Fi'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
