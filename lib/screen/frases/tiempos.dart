import 'package:flutter/material.dart';
import 'package:guara/components/publicidad.dart';
import 'package:guara/layout/tarjeta_trad.dart';
import '../../config/get_info.dart';
import '../../modelos/palabras.dart';

class Tiempos extends StatefulWidget {
  const Tiempos({super.key});

  @override
  State<Tiempos> createState() => _TiemposState();
}

class _TiemposState extends State<Tiempos> {
  List<Palabra> momentos = List.empty(growable: true);

  @override
  void initState () {
    Public_pantalla_compl().cargaAd();
    loadJsonData('bdd/momentos.json').then((value){
      setState(() {
        momentos.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Momentos del día"),
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
              itemCount: momentos.length,
              itemBuilder: (BuildContext context, int index) {
                return Tarjeta_traduccion(palabra: momentos[index]);
              },
            )),
            Publicidad_inferior()
          ],
        ),
      ))
    );
  }
}