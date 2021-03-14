import 'dart:ui';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:linocinema/services/ad_manager.dart';
import 'package:linocinema/ui/screens/tvshows/tvshow_download_screen.dart';
import 'package:page_transition/page_transition.dart';

class TvshowDetail extends StatefulWidget {
  final Map user;
  final int id;
  final String image;
  final String imageLink;
  final String title;
  final String trailer;
  final String genre;
  final int year;
  final String language;
  final String description;

  const TvshowDetail({
    Key key,
    this.id,
    this.user,
    this.image,
    this.imageLink,
    this.title,
    this.trailer,
    this.genre,
    this.year,
    this.language,
    this.description,
  }) : super(key: key);

  @override
  _TvshowDetailState createState() => _TvshowDetailState();
}

class _TvshowDetailState extends State<TvshowDetail> {
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

  @override
  void initState() {
    super.initState();
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
                          'Tvshows',
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
                      'LANGUAGE: ${widget.language}',
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
                                      child:
                                          TvshowDownloadScreen(id: widget.id)));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.download_outlined),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  'SELECT SEASON',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              onPrimary: Colors.white,
                            ),
                          ),
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
