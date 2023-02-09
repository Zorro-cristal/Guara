import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guara2/components/lista_palabras.dart';
import 'package:guara2/styles/entrada_texto.dart';
import '../config/palabras.dart';

class GuaraEspanhol extends StatefulWidget {
  const GuaraEspanhol({super.key});

  @override
  State<GuaraEspanhol> createState() => _GuaraEspanholState();
}

class _GuaraEspanholState extends State<GuaraEspanhol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Español a Guarani')),
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.lightGreen)
                ),
                color: Colors.lightGreen[400],
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        color: Colors.yellow[300],
                        elevation: 15,
                        child: TextField(
                          style: Disenho_Entrada_texto,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Palabra/Ñe'ẽ",
                            labelStyle: TextStyle(color: Colors.black54)
                          ),
                          /* onChange: (texto) => {
                            texto= texto.toLowerCase();
                            setState(
                              () => palabraDisplay= listaPalabra.where(
                                (palabra) {
                                  var elemento= palabra.castellano.toLowerCase();
                                  return elemento.constrains(texto);
                                }
                              ).toList()
                            )
                          } */
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),           
            Lista_palabras(idioma: 'g'),
          ],
        ),
      ),)
    );
  }
}