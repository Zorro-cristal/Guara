import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guara2/config/capitalizar.dart';
import '../config/get_info.dart';
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

  @override
  void initState() {
    loadJsonData('bdd/palabra.json').then((value) {
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
                              ? capitalizar(palabraDisplay[index].castellano)
                              : capitalizar(palabraDisplay[index].guarani),
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
