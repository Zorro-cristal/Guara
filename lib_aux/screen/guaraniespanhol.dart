import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../lib2/palabras.dart';
import '../../lib2/screen/infoAux.dart';
import '../../lib2/screen/infoespanhol.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String publicGener= 'ca-app-pub-6184780932224233/9552397401';
const String testDevice= 'ca-app-pub-6184780932224233/9387233102';

class GuaraniEspanholHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GuaraniEspanhol();
}

class GuaraniEspanhol extends State<GuaraniEspanholHome>{

  List<Palabra> listaPalabras= List<Palabra>();
  List<Palabra> palabraDisplay= List<Palabra>();

  String conversion(String letra) {
    for (int i=0; i< letra.length; i++) {
      if (letra[i] == "ç") {
        letra= "ỹ";
      } else if (letra[i] == "@") {
        letra= "g̃";
      }
    }
    return letra;
  }

  static Future <List<Palabra>> loadJsonData() async {
    var palabras= List<Palabra>();
    var response= await rootBundle.loadString('bdd/palabra.json');
    var datasJson= json.decode(response);
    for (var dataJson in datasJson) {
      palabras.add(Palabra.fromJson(dataJson));
    }
    return palabras;
  }

  static const MobileAdTargetingInfo targetingInfo= MobileAdTargetingInfo(
    testDevices: publicGener != null ? <String>[publicGener]:null,
    nonPersonalizedAds: true,
    keywords: <String>['bar', 'too'],
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
        listaPalabras.addAll(value);
        palabraDisplay= listaPalabras;
      });
    });
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-6184780932224233~9641394298');
    _bannerAd= createBannerAd() .. load() .. show();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Guaranigui Castellanope"),
      ),
      body: SafeArea(child: Container(
          decoration: BoxDecoration(
            //color: Colors.blueGrey[100],
          ),
          child: Column( 
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(child: Column(children: [
              Expanded(
                flex: 2,
                child: Card(
                  //padding: const EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color:Colors.lightGreen[200])
                  ),
                  color: Colors.lightGreen[400],
                  elevation: 10,
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(padding: EdgeInsets.all(10),
                      child: Card(
                        color: Colors.yellow[300],
                        elevation: 15,
                        child: TextField(
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black45
                    ),      
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Palabra/Ñe'ẽ",
                      labelStyle: TextStyle(
                        color: Colors.black54
                      )
                    ),
                    onChanged: (text) {
                      text= text.toLowerCase();
                      text= conversion(text);
                      setState(() {
                        palabraDisplay= listaPalabras.where((palabra) {
                          var elemento= palabra.guarani.toLowerCase();
                          return elemento.contains(text);
                        }).toList();
                      });
                    },
                  ),
                      ),
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        //elevation: 10,
                        /*shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color:Colors.lightGreen[300])
                        ),*/
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                title: Text(
                                  "Instrucciones/Mo'ãranduha",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                  ),
                                ),
                                backgroundColor: Colors.blue[400],
                                children: <Widget>[
                                  Card(
                                    color: Colors.grey[200],
                                    elevation: 25,
                                    child:
                                      Text(
                                        "Para buscar con la vocal ỹ, usaremos con el simbolo ç.\nPara buscar con la consonante g̃, usaremos con el simbolo @.",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                  ),
                                  Container(height: 10),
                                  Card(
                                    color: Colors.grey[200],
                                    elevation: 25,
                                    child:
                                      Text(
                                        "Jaheka hag̃ua pu'ae tĩgua ỹ, hendaguepe jaipuruta ç.\nJaheka hag̃ua pundie tĩgua g̃, hendaguepe jaipuruta @.",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                  )
                                ],
                              );
                            }
                          );
                        },
                        //color: Colors.orange,
                        child:
                        Container(
                          //width: 310,
                          height: 65,
                          child: Text(
                          "Ayuda para busquedas\nPytyvõ jaheka hag̃ua",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 26,
                            color: Colors.black87
                          ),
                        ),
                        ),
                      )
                    ],
                  ),
                  Container(height: 13)
                ]),
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: palabraDisplay.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async{
                        print(palabraDisplay[index].castellano);
                        var result= await Connectivity().checkConnectivity();
                        if (result == ConnectivityResult.none) {
                          Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => HomeInfoAux(palabraDisplay[index]))
                          );
                        } else {
                          Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => HomeInfoEspanhol(palabraDisplay[index]))
                          );
                        }
                      },
                      child:
                      Card(
                        //color: Colors.blue[100],
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget> [
                              Text(
                                palabraDisplay[index].guarani,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ]
                          ),
                        ),
                      ),
                    );
                  },
                )
              ),
              Container(height: 50)
            ]),),)
        ],
      ),),)
    );
  }
}