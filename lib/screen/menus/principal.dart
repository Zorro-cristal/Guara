import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:guara/layout/boton.dart';
import 'package:guara/rutas/rutas.dart';
import 'package:guara/styles/fondo_pantalla.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      titulo: "Castellano a guarani",
                      semantica: 'Traducir de castellano a guarani',
                    )
                  ],
                ),
                Container(height: distancia),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(
                      presionado: () => navegar(context, 'GuaraniEspanhol'),
                      titulo: "Guaranigui castellanope",
                      semantica: 'Traducir de guarani a castellano',
                    )
                  ],
                ),
                Container(height: distancia),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(
                      presionado: () => navegar(context, 'Numeros'),
                      titulo: "Numeros/Papaha",
                      semantica: 'Numeros en guarani y castellano',
                    )
                  ],
                ),
                Container(height: distancia),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(
                      presionado: () => navegar(context, "Frases"),
                      titulo: "Frases",
                      semantica: 'frases diarias',
                    )
                  ],
                ),
                Container(height: distancia),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Boton(
                      presionado: () => navegar(context, 'Sugerencia'),
                      titulo: "Sugerencias/Ñembohape",
                      semantica: 'Enviar sugerencias',
                    )
                  ],
                ),
                Container(height: distancia),
                Center(
                  child: Text.rich(TextSpan(
                    style: TextStyle(fontSize: 20),
                    children: [
                      TextSpan(
                        text: 'Politica de privacidad',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            const url = 'https://1drv.ms/b/s!An07D-r-noDVyU8gzUQXc4Voz-g5?e=kGGdRK';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'No se pudo lanzar $url';
                            }
                          },
                      ),
                    ]
                  )),
                )
              ],
            )),
      ),
    );
  }
}
