import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linocinema/services/ad_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreDownloadScreen extends StatefulWidget {
  final String link;
  final String subtitle;

  const ExploreDownloadScreen({Key key, this.link, this.subtitle})
      : super(key: key);

  @override
  _ExploreDownloadScreenState createState() => _ExploreDownloadScreenState();
}

class _ExploreDownloadScreenState extends State<ExploreDownloadScreen> {
  _launchURL() async {
    var url = '${widget.link}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchHowToDownloadURL() async {
    var url = 'https://www.linocinema.com/docs/how_to_download_movie';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchSubtitleURL() async {
    var url = '${widget.subtitle}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  nullsubtitle() {
    if (widget.subtitle == null) {
      return ElevatedButton(
        child: Text(
          'No Subtitle',
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.white,
        ),
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
      );
    } else {
      return ElevatedButton(
        child: Text(
          'Download Subtitle',
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
        onPressed: _launchSubtitleURL,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
          title: Row(
        children: [
          Icon(Icons.download_outlined),
          SizedBox(
            width: 5.0,
          ),
          Text(
            'LinoCinema Download',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Icon(
                Icons.download_outlined,
                size: 200.0,
                color: Colors.black,
              ),
              Center(
                child: Text(
                  'LinoCinema App does not handle download in app yet!!!' +
                      'Use the floating button at the bottom right to download in browser.',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
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
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              nullsubtitle(),
              ElevatedButton(
                child: Text(
                  'How to download',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
                onPressed: _launchHowToDownloadURL,
              ),
              ElevatedButton(
                child: Text(
                  'Copy download link',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: '${widget.link}'));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Download Link Copied'),
                  ));
                },
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
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
        onPressed: _launchURL,
        child: Text(
          'download in browser',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
