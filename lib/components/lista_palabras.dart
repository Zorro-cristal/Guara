import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../config/palabras.dart';

class Lista_palabras extends StatefulWidget {
  String? palabra;
  String idioma;
  Lista_palabras({super.key, this.palabra, required this.idioma});

  @override
  State<Lista_palabras> createState() => _Lista_palabrasState();
}

class _Lista_palabrasState extends State<Lista_palabras> {
  List<Palabra> palabraDisplay = List.empty(growable: true);
  List<Palabra> listaPalabras = List.empty(growable: true);

  static Future<List<Palabra>> loadJsonData() async {
    List<Palabra> palabras = List.empty(growable: true);
    var response = await rootBundle.loadString('bdd/palabra.json');
    var datasJson = json.decode(response);
    for (var dataJson in datasJson) {
      var pal = Palabra.fromJson(dataJson);
      palabras.add(pal);
    }
    return palabras;
  }

  @override
  void initState() {
    loadJsonData().then((value) {
      listaPalabras.addAll(value);
      setState(() {
        palabraDisplay = listaPalabras;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: palabraDisplay.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () async {},
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          widget.idioma == 'c'
                              ? palabraDisplay[index].castellano
                              : palabraDisplay[index].guarani,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
