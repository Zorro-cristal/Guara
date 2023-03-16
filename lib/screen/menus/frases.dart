import 'package:flutter/material.dart';
import 'package:guara/layout/boton.dart';
import 'package:guara/rutas/rutas.dart';
import 'package:guara/styles/fondo_pantalla.dart';

class Frases extends StatelessWidget {
  const Frases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: Fondo_pantalla("frases"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(
                    presionado: () => navegar(context, "Saludos"),
                    titulo: "Saludos"),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(
                    presionado: () => navegar(context, "Presentaciones"),
                    titulo: "Presentaciones"),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(
                    presionado: () => navegar(context, "Cortesia"),
                    titulo: "Costesia"),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(
                    presionado: () => navegar(context, "Tiempos"),
                    titulo: "Tiempos"),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(
                    presionado: () => navegar(context, "Direcciones"),
                    titulo: "Direcciones"),
              ],
            )
          ],
        ),
      )),
    );
  }
}
