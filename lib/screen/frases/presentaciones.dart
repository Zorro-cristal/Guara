import 'package:flutter/material.dart';
import 'package:guara2/config/palabras.dart';
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
                  return Card(
                    color: Colors.blue[200],
                    elevation: 10,
                    margin: EdgeInsets.all(6),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Text(
                            presentacion[index].guarani,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(8),
                          subtitle: Text(
                            presentacion[index].castellano,
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )),
                  );
                },
              )),
              Container(height: 75)
            ],
          ),
        )));
  }
}
