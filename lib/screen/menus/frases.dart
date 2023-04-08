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
                    titulo: "Saludos",
                    semantica: 'Frases de saludo',),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(
                    presionado: () => navegar(context, "Presentaciones"),
                    titulo: "Presentaciones",
                    semantica: 'Frases para presentarse',),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(
                    presionado: () => navegar(context, "Cortesia"),
                    titulo: "Cortesia",
                    semantica: 'Frases de cortesia',),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(
                    presionado: () => navegar(context, "Tiempos"),
                    titulo: "Tiempos",
                    semantica: 'Frases para señalar momentos del dia',),
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boton(
                    presionado: () => navegar(context, "Direcciones"),
                    titulo: "Direcciones",
                    semantica: 'Frases para usar con direcciones',),
              ],
            )
          ],
        ),
      )),
    );
  }
}
