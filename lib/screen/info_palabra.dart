import 'package:flutter/material.dart';
import 'package:guara2/config/capitalizar.dart';
import 'package:guara2/styles/fondo_pantalla.dart';
import '../modelos/palabras.dart';
import 'package:guara2/components/busqueda.dart';

class Info_palabra extends StatefulWidget {
  Palabra palabras;
  Info_palabra({super.key, required this.palabras});

  @override
  State<Info_palabra> createState() => _Info_palabraState();
}

class _Info_palabraState extends State<Info_palabra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traduccion"),
      ),
      body: SafeArea(
        child: Container(
            decoration: Fondo_pantalla("info_castellano"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: SelectableText.rich(
                          //textAlign: TextAlign.center,
                          TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        capitalizar(widget.palabras.castellano),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: '\n',
                                    style: TextStyle(fontSize: 15.0)),
                                TextSpan(
                                    text: capitalizar(widget.palabras.guarani),
                                    style: TextStyle(color: Colors.black))
                              ]),
                        ),
                      )),
                ),
                SizedBox(height: 50),
                Busqueda(palabra: widget.palabras.castellano),
              ],
            )),
      ),
    );
  }
}
