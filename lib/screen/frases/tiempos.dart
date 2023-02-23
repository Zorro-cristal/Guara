import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                return Card(
                    color: Colors.blue[200],
                    elevation: 10,
                    margin: EdgeInsets.all(6),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: 
                        ListTile(
                          title: Text(
                            momentos[index].guarani,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(8),
                          subtitle: Text(
                            momentos[index].castellano,
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