import 'dart:io';

class AdMobService {

  String getAdMobAppId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4932308755350503~9545062779';
    } else if (Platform.isIOS) {
      return null;
    }
    return null;
  }

  String getBannerAdId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4932308755350503/8076519111';
      // return 'ca-app-pub-3940256099942544/6300978111'; // Test unit
    } else if (Platform.isIOS) {
      return null;
    }
    return null;
  }

  String getInterstitialAdId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4932308755350503/6188722375';
      // return 'ca-app-pub-3940256099942544/1033173712'; // Test unit
    } else if (Platform.isIOS) {
      return null;
    }
    return null;
  }

}