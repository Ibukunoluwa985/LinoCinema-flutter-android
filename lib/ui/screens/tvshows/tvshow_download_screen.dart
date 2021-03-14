import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:linocinema/models/season_api.dart';
import 'package:linocinema/services/ad_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class TvshowDownloadScreen extends StatefulWidget {
  final int id;

  const TvshowDownloadScreen({Key key, this.id}) : super(key: key);

  @override
  _TvshowDownloadScreenState createState() => _TvshowDownloadScreenState();
}

class _TvshowDownloadScreenState extends State<TvshowDownloadScreen> {
  List seasons = [];
  bool isLoading = true;

  _launchHowToDownloadURL() async {
    var url = 'https://www.linocinema.com/docs/how_to_download_tvshow';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> setupSeasonApi() async {
    SeasonApi inst = SeasonApi();
    await inst.seasonApi(context);
    if (inst.seasons == null) {
      seasons = [];
    } else {
      setState(() {
        isLoading = false;
        seasons = inst.seasons;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupSeasonApi();
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
              Center(
                child: Text(
                  'Select season and episode to download.',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(children: [
                if (isLoading)
                  Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  )),
                for (var item in seasons)
                  if (item['tvshow']['id'] == widget.id)
                    ListTile(
                      title: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () async {
                          var url = '${item['episode_download_link']}';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          'Season ${item['season_number']} Episode ${item['episode_number']}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              ]),
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
            ],
          ),
        ),
      ),
    );
  }
}
