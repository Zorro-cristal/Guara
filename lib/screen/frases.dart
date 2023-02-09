import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guara2/layout/boton.dart';
import 'package:guara2/rutas/rutas.dart';
import 'package:guara2/styles/fondo_pantalla.dart';

class Frases extends StatelessWidget {
  const Frases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        decoration: Fondo_pantalla("frases"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(presionado: () => navegar(context, "Saludos"), titulo: "Saludos"),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(presionado: () {}, titulo: "Presentaciones"),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(presionado: () {}, titulo: "Costesia"),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(presionado: () {}, titulo: "Tiempos"),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(presionado: () {}, titulo: "Direcciones"),
              ],
            )
          ],
        ),
      )),
    );
  }
}