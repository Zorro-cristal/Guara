import 'package:flutter/material.dart';
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
                  return Card(
                    color: Colors.blue[200],
                    elevation: 10,
                    margin: EdgeInsets.all(6),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Text(
                            cortesia[index].guarani,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(8),
                          subtitle: Text(
                            cortesia[index].castellano,
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )),
                  );
                },
              ))
            ],
          ),
        )));
  }
}
