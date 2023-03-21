import 'package:flutter/material.dart';
import 'package:guara/components/publicidad.dart';
import 'package:guara/layout/tarjeta_trad.dart';

import '../../config/get_info.dart';
import '../../modelos/palabras.dart';

class Numeros extends StatefulWidget {
  const Numeros({super.key});

  @override
  State<Numeros> createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {
  List<Palabra> numeros = List.empty(growable: true);

  @override
  void initState() {
    loadJsonData('bdd/numeros.json').then((value) {
      setState(() {
        numeros.addAll(value);
      });
    });
    Public_pantalla_compl().cargaAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Numeros")),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: numeros.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Tarjeta_traduccion(palabra: numeros[index]);
                  },
                ),
              ),
              Publicidad_inferior(),
            ],
          ),
        ),
      ),
    );
  }
}
