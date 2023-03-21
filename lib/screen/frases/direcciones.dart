

import 'package:flutter/material.dart';
import 'package:guara/components/publicidad.dart';
import 'package:guara/layout/tarjeta_trad.dart';

import '../../config/get_info.dart';
import '../../modelos/palabras.dart';

class Direcciones extends StatefulWidget {
  const Direcciones({super.key});

  @override
  State<Direcciones> createState() => _DireccionesState();
}

class _DireccionesState extends State<Direcciones> {
  List<Palabra> direcciones = List.empty(growable: true);

  @override
  void initState () {
    Public_pantalla_compl().cargaAd();
    loadJsonData('bdd/direcciones.json').then((value){
      setState(() {
        direcciones.addAll(value);
      });
    });
    super.initState();
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
                return Tarjeta_traduccion(palabra: direcciones[index]);
              },
            )),
            Publicidad_inferior(),
          ],
        ),
      ))
    );
  }
}