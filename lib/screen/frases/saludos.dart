import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guara2/modelos/palabras.dart';

import '../../config/get_info.dart';

class Saludos extends StatefulWidget {
  const Saludos({super.key});

  @override
  State<Saludos> createState() => _SaludosState();
}

class _SaludosState extends State<Saludos> {
  List<Palabra> listaPalabras = List.empty(growable: true);

  @override
  void initState() {
    loadJsonData('bdd/saludos.json').then((value) {
      setState(() {
        listaPalabras.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saludos")),
      body: SafeArea(child: Container(
        decoration: BoxDecoration(color: Colors.blueGrey[100]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: listaPalabras.length,
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
                            listaPalabras[index].guarani,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(8),
                          subtitle: Text(
                            listaPalabras[index].castellano,
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
          ],
        ),
      )),
    );
  }
}