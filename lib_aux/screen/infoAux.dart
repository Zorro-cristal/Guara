import 'dart:async';
import 'package:flutter/material.dart';
import '../../lib2/main.dart';
import '../../lib2/palabras.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:connectivity/connectivity.dart';

const String publicGener= 'ca-app-pub-6184780932224233/9552397401';
const String testDevice= 'ca-app-pub-6184780932224233/9387233102';

class HomeInfoAux extends StatefulWidget{
  Palabra palabras;
  HomeInfoAux(this.palabras);

  @override
  InfoAux createState() => InfoAux();
}

class InfoAux extends State<HomeInfoAux> {

  Future<String> definicion;
  Completer<WebViewController> controlador= Completer<WebViewController>();

  static const MobileAdTargetingInfo targetingInfo= MobileAdTargetingInfo(
    testDevices: publicGener != null ? <String>[publicGener]:null,
    nonPersonalizedAds: true,
    keywords: <String>['bar', 'too'],
  );

  BannerAd _bannerAd;
  InterstitialAd _nativeAd;

  InterstitialAd createInterstitialAd () {
    return InterstitialAd(
      adUnitId: 'ca-app-pub-6184780932224233/9387233102',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitiaAd event $event");
      }
    );
  }

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: 'ca-app-pub-6184780932224233/9552397401',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd $event");
      }
    );
  }

  @override
  void initState () {
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-6184780932224233~9641394298');
    _bannerAd= createBannerAd() .. load() .. show();
    print(contadorPublic);
    if (contadorPublic == 5) {
      contadorPublic= 0;
      _nativeAd= createInterstitialAd() .. load() .. show();
    }
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    contadorPublic++;
    print(contadorPublic);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Traduccion"),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/definicion.jpg"),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /*Container(
            color: Colors.blue,
            alignment: Alignment.center,
            height: 300,
            child:
              WebView(
                initialUrl: 'https://images.google.com/images?q=' + widget.palabras.castellano,
                javascriptMode: JavascriptMode.unrestricted,
              ),
          ),*/
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: 
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan> [
                      TextSpan(
                        text: capitalizar(widget.palabras.castellano),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      TextSpan(text: '\n', style: TextStyle(fontSize: 15.0)),
                      TextSpan(
                        text: capitalizar(widget.palabras.guarani),
                        style: TextStyle(
                          color: Colors.black
                        )
                      )
                    ]
                  ),
                )
            ),
          ),
        ],
      )
        ),
      ),
    );
  }
  String capitalizar (String texto) {
    return "${texto[0].toUpperCase()}${texto.substring(1)}";
  }
}