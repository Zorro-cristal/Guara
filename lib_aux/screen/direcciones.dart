import 'package:flutter/material.dart';
import '../../lib2/palabras.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice= 'ca-app-pub-6184780932224233/9552397401';

class DireccionesHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Direcciones();
}

class Direcciones extends State<DireccionesHome> {
  List<Palabra> direcciones= List<Palabra>();

  static Future <List<Palabra>> loadJsonData() async {
    var palabras= List<Palabra>();
    var response= await rootBundle.loadString('bdd/direcciones.json');
    var datasJson= json.decode(response);
    for (var dataJson in datasJson) {
      palabras.add(Palabra.fromJson(dataJson));
    }
    return palabras;
  }

  static const MobileAdTargetingInfo targetingInfo= MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice]:null,
    nonPersonalizedAds: true,
    keywords: <String>['bar', 'too'],
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
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
        direcciones.addAll(value);
      });
    });
    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
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
        title: Text("Direcciones"),
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
              itemCount: direcciones.length,
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
                            direcciones[index].guarani,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(8),
                          subtitle: Text(
                            direcciones[index].castellano,
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                    ),
                  );
              },
            )),
            Container(
              height: 75
            )
          ],
        ),
      ))
    );
  }
}