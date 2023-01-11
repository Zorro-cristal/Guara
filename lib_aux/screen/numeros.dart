import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../lib2/palabras.dart';
import 'package:firebase_admob/firebase_admob.dart';
import '../../lib2/publicidad.dart';
import 'package:admob_flutter/admob_flutter.dart';

const String testDevice= 'ca-app-pub-6184780932224233/9552397401';

class NumerosHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Numeros();
}

class Numeros extends State<NumerosHome> {
  List<Palabra> numeros= List<Palabra>();

  static Future <List<Palabra>> loadJsonData() async {
    var palabras= List<Palabra>();
    var response= await rootBundle.loadString('bdd/numeros.json');
    var datasJson= json.decode(response);
    for (var dataJson in datasJson) {
      palabras.add(Palabra.fromJson(dataJson));
    }
    return palabras;
  }

  final abs= AdMobService ();

  /*static const MobileAdTargetingInfo targetingInfo= MobileAdTargetingInfo(
    //testDevices: testDevice != null ? <String>[testDevice]:null,
    nonPersonalizedAds: true,
    //keywords: <String>['bar', 'too'],
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: 'ca-app-pub-6184780932224233/9552397401',
      //adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd $event");
        print(testDevice);
      }
    );
  }*/

  @override
  void initState () {
    loadJsonData().then((value){
      setState(() {
        numeros.addAll(value);
      });
    });
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-6184780932224233~9641394298');
    //_bannerAd= createBannerAd() .. load() .. show();
    Admob.initialize(abs.getAdmobAppId());
    super.initState();
  }

  @override
  void dispose() {
    //_bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numeros")
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: 
              ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: numeros.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    color: Colors.blue[200],
                    elevation: 10,
                    margin: EdgeInsets.all(6),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: 
                        ListTile(
                          title: Text(
                            numeros[index].guarani,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(8),
                          subtitle: Text(
                            numeros[index].castellano,
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),),
              AdmobBanner(adUnitId: abs.getBannerAdId(), adSize: AdmobBannerSize.FULL_BANNER)
            ],
          ),
        ),
      ),
    );
  }
}