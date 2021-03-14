import 'dart:ui';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:linocinema/services/ad_manager.dart';
import 'package:linocinema/ui/screens/movies/movie_download_screen.dart';
import 'package:omdb_dart/omdb_dart.dart';
import 'package:page_transition/page_transition.dart';

class MovieDetail extends StatefulWidget {
  final Map user;
  final String image;
  final String imageLink;
  final String link;
  final String title;
  final String trailer;
  final String genre;
  final int year;
  final int mb;
  final String subtitle;
  final String description;

  const MovieDetail({
    Key key,
    this.user,
    this.image,
    this.imageLink,
    this.link,
    this.title,
    this.trailer,
    this.genre,
    this.year,
    this.mb,
    this.subtitle,
    this.description,
  }) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  String omdbRatings = '';
  String omdbLanguage = '';
  String omdbDirector = '';

  imageList() {
    if (widget.imageLink != 'None') {
      return CachedNetworkImage(
          memCacheWidth: 200,
          memCacheHeight: 360,
          imageUrl: widget.imageLink,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Column(
                children: [
                  Icon(Icons.error),
                  Text(
                    'error occured',
                    style: TextStyle(fontSize: 8.0),
                  )
                ],
              ));
    } else {
      return CachedNetworkImage(
          memCacheWidth: 200,
          memCacheHeight: 360,
          imageUrl: "https://www.linocinema.com${widget.image}",
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Column(
                children: [
                  Icon(Icons.error),
                  Text(
                    'error occured',
                    style: TextStyle(fontSize: 8.0),
                  )
                ],
              ));
    }
  }

  imageListProvider() {
    if (widget.imageLink != 'None') {
      return CachedNetworkImageProvider(
        widget.imageLink,
        maxWidth: 200,
        maxHeight: 360,
      );
    } else {
      return CachedNetworkImageProvider(
        "https://www.linocinema.com${widget.image}",
        maxWidth: 200,
        maxHeight: 360,
      );
    }
  }

  Future<void> getMovieOmdb() async {
    Omdb omdb = Omdb("79efffcf", "${widget.title}");
    await omdb.getMovie();
    setState(() {
      omdbRatings = omdb.movie.imdbRating;
      omdbLanguage = omdb.movie.language;
      omdbDirector = omdb.movie.director;
    });
  }

  nullsubtitle() {
    if (widget.subtitle == null) {
      return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    elevation: 16,
                    titleTextStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    contentTextStyle: TextStyle(color: Colors.white),
                    backgroundColor: Colors.black,
                    title: Text('No Subtitle'),
                    content: Text(
                      'Sorry this movie has no subtitle yet.',
                    ),
                  ));
        },
        child: Row(
          children: [
            Icon(Icons.subtitles),
            SizedBox(
              width: 2.0,
            ),
            Text(
              'NO SUBTITLE',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.white,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  duration: Duration(milliseconds: 700),
                  type: PageTransitionType.rightToLeftWithFade,
                  child: MovieDownloadScreen(
                      link: widget.link, subtitle: widget.subtitle)));
        },
        child: Row(
          children: [
            Icon(Icons.subtitles),
            SizedBox(
              width: 2.0,
            ),
            Text(
              'SUBTITLE',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getMovieOmdb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        imageList(),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.grey],
                  stops: [0.0, 0.9],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 10.0),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Container(
                          width: 400.0,
                          height: 300.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: imageListProvider(), fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20.0,
                                  offset: Offset(0.0, 10.0))
                            ])),
                  ],
                ),
              ),
              Container(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse,
                          color: Colors.yellow,
                          size: 20.0,
                        ),
                        Text(
                          '${widget.year}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.list,
                          color: Colors.yellow,
                          size: 20.0,
                        ),
                        Text(
                          'Movies',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20.0,
                        ),
                        Text(
                          '$omdbRatings/10',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.category,
                          color: Colors.yellow,
                          size: 20.0,
                        ),
                        Text(
                          '${widget.genre}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
                child: Text(
                  widget.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'DIRECTOR: $omdbDirector',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                    Text(
                      'LANGUAGE: $omdbLanguage',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                    Text(
                      'SIZE: ${widget.mb} MB',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                    Text(
                      'UPLOADED BY: ${widget.user['username']}',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: AdmobBanner(
                  adUnitId: AdMobService().getBannerAdId(),
                  adSize: AdmobBannerSize.ADAPTIVE_BANNER(
                      width: MediaQuery.of(context).size.width.toInt()),
                ),
              ),
              Text(
                'advertisement',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      duration: Duration(milliseconds: 700),
                                      type: PageTransitionType
                                          .leftToRightWithFade,
                                      child: MovieDownloadScreen(
                                          link: widget.link,
                                          subtitle: widget.subtitle)));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.download_outlined),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  'DOWNLOAD',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              onPrimary: Colors.white,
                            ),
                          ),
                          nullsubtitle(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: AdmobBanner(
                  adUnitId: AdMobService().getBannerAdId(),
                  adSize: AdmobBannerSize.ADAPTIVE_BANNER(
                      width: MediaQuery.of(context).size.width.toInt()),
                ),
              ),
              Text(
                'advertisement',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
