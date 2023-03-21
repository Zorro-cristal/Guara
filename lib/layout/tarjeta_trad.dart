import 'package:flutter/material.dart';
import 'package:guara/modelos/palabras.dart';

class Tarjeta_traduccion extends StatelessWidget {
  final Palabra palabra;

  const Tarjeta_traduccion({required this.palabra});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      hint: 'En guarani es ' +
          palabra.guarani +
          'y en castellano es ' +
          palabra.castellano,
      child: Card(
        color: Colors.blue[200],
        elevation: 10,
        margin: EdgeInsets.all(6),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                palabra.guarani,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              contentPadding: EdgeInsets.all(8),
              subtitle: Text(
                palabra.castellano,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )),
      ),
    );
  }
}
