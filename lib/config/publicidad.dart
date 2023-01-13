import 'dart:io';

class AdMobService {
  String? getAdmobAppId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6184780932224233~9641394298';
    }
    return null;
  }
  String? getBannerAdId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6184780932224233/9552397401';
    }
    return null;
  }
}