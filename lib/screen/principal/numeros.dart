import 'package:flutter/material.dart';
import 'package:guara/components/publicidad.dart';

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
                    return Card(
                      color: Colors.blue[200],
                      elevation: 10,
                      margin: EdgeInsets.all(6),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
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
                          )),
                    );
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
