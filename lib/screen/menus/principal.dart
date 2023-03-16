import 'package:flutter/material.dart';
import 'package:guara/layout/boton.dart';
import 'package:guara/rutas/rutas.dart';
import 'package:guara/styles/fondo_pantalla.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    var distancia = 7.0;
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: Fondo_pantalla("principal"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(
                        presionado: () => navegar(context, 'EspanholGuarani'),
                        titulo: "Castellano a guarani")
                  ],
                ),
                Container(height: distancia),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(
                        presionado: () => navegar(context, 'GuaraniEspanhol'),
                        titulo: "Guaranigui castellanope")
                  ],
                ),
                Container(height: distancia),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(
                        presionado: () => navegar(context, 'Numeros'),
                        titulo: "Numeros/Papaha")
                  ],
                ),
                Container(height: distancia),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(
                        presionado: () => navegar(context, "Frases"),
                        titulo: "Frases")
                  ],
                ),
                Container(height: distancia),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(
                        presionado: () => navegar(context, 'Sugerencia'),
                        titulo: "Sugerencias/Ñembohape")
                  ],
                ),
                Container(height: distancia),
              ],
            )),
      ),
    );
  }
}
