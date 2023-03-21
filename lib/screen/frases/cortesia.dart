import 'package:flutter/material.dart';
import 'package:guara/components/publicidad.dart';
import 'package:guara/layout/tarjeta_trad.dart';
import '../../config/get_info.dart';
import '../../modelos/palabras.dart';

class Cortesia extends StatefulWidget {
  const Cortesia({super.key});

  @override
  State<Cortesia> createState() => _CortesiaState();
}

class _CortesiaState extends State<Cortesia> {
  List<Palabra> cortesia = List.empty(growable: true);

  @override
  void initState() {
    Public_pantalla_compl().cargaAd();
    loadJsonData('bdd/cortesia.json').then((value) {
      setState(() {
        cortesia.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expresiones de cortesía"),
        ),
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: cortesia.length,
                itemBuilder: (BuildContext context, int index) {
                  return Tarjeta_traduccion(palabra: cortesia[index]);
                },
              )),
              Publicidad_inferior(),
            ],
          ),
        )));
  }
}
