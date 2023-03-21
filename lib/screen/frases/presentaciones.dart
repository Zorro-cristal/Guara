import 'package:flutter/material.dart';
import 'package:guara/components/publicidad.dart';
import 'package:guara/layout/tarjeta_trad.dart';
import 'package:guara/modelos/palabras.dart';
import '../../config/get_info.dart';

class Presentaciones extends StatefulWidget {
  const Presentaciones({super.key});

  @override
  State<Presentaciones> createState() => _PresentacionesState();
}

class _PresentacionesState extends State<Presentaciones> {
  List<Palabra> presentacion = List.empty(growable: true);

  @override
  void initState() {
    Public_pantalla_compl().cargaAd();
    loadJsonData('bdd/presentacion.json').then((value) {
      setState(() {
        presentacion.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Presentaciones"),
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
                itemCount: presentacion.length,
                itemBuilder: (BuildContext context, int index) {
                  return Tarjeta_traduccion(palabra: presentacion[index]);
                },
              )),
              Publicidad_inferior(),
            ],
          ),
        )));
  }
}
