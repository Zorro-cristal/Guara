import 'package:flutter/material.dart';
import '../../lib2/palabras.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice= 'ca-app-pub-6184780932224233/9552397401';

class CortesiaHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Cortesia();
}

class Cortesia extends State<CortesiaHome> {
  List<Palabra> cortesia= List<Palabra>();

  static Future <List<Palabra>> loadJsonData() async {
    var palabras= List<Palabra>();
    var response= await rootBundle.loadString('bdd/cortesia.json');
    var datasJson= json.decode(response);
    for (var dataJson in datasJson) {
      palabras.add(Palabra.fromJson(dataJson));
    }
    return palabras;
  }

  static const MobileAdTargetingInfo targetingInfo= MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice]:null,
    nonPersonalizedAds: true,
  );

  BannerAd _bannerAd;

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
    loadJsonData().then((value){
      setState(() {
        cortesia.addAll(value);
      });
    });
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-6184780932224233~9641394298');
    _bannerAd= createBannerAd() .. load() .. show();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expresiones de cortesía"),
      ),
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: cortesia.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    color: Colors.blue[200],
                    elevation: 10,
                    margin: EdgeInsets.all(6),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: 
                        ListTile(
                          title: Text(
                            cortesia[index].guarani,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(8),
                          subtitle: Text(
                            cortesia[index].castellano,
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                    ),
                  );
              },
            ))
          ],
        ),
      ))
    );
  }
}