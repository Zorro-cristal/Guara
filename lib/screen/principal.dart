import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guara2/layout/boton.dart';
import 'package:guara2/rutas/rutas.dart';
import 'package:guara2/styles/fondo_pantalla.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
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
                      presionado: () => navegar(context, 'EspanholGuarani'), titulo: "Castellano a guarani")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(
                        presionado: () => navegar(context, 'GuaraniEspanhol'),
                        titulo: "Guaranigui castellanope")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(presionado: () => null, titulo: "Numeros/Papaha")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Boton(presionado: () => null, titulo: "Frases")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(presionado: () => navegar(context, 'Sugerencia'), titulo: "Sugerencias/Ñembohape")
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
