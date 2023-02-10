

import 'package:flutter/material.dart';

import '../../config/get_info.dart';
import '../../config/palabras.dart';

class Direcciones extends StatefulWidget {
  const Direcciones({super.key});

  @override
  State<Direcciones> createState() => _DireccionesState();
}

class _DireccionesState extends State<Direcciones> {
  List<Palabra> direcciones = List.empty(growable: true);

  @override
  void initState () {
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