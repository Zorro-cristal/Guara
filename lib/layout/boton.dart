import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  final Function presionado;
  final String titulo;

  const Boton({super.key, required this.presionado, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          border: Border.all(
            //color: Colors.blue[900],
            color: Colors.blue,
            width: 8,
          ),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(35)),
      child: TextButton(
        onPressed: () => presionado(),
        /* onPressed: () {
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) => EspanholGuaraniHome())
          );
        }, */
        //padding: const EdgeInsets.all(8.0),
        child: Text(
          titulo,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 28.5, fontStyle: FontStyle.italic, color: Colors.black),
        ),
        //)
      ),
    );
  }
}
