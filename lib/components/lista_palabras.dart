import 'package:flutter/material.dart';
import 'package:guara/components/publicidad.dart';
import 'package:guara/config/capitalizar.dart';
import 'package:guara/screen/info_palabra.dart';
import '../config/get_info.dart';
import '../modelos/palabras.dart';
import '../config/filtro_palabras.dart';

class Lista_palabras extends StatefulWidget {
  String palabra;
  String idioma;
  Lista_palabras({super.key, required this.palabra, required this.idioma});

  @override
  State<Lista_palabras> createState() => _Lista_palabrasState();
}

class _Lista_palabrasState extends State<Lista_palabras> {
  List<Palabra> palabraDisplay = List.empty(growable: true);
  List<Palabra> listaPalabras = List.empty(growable: true);
  int cont = 0;

  @override
  void initState() {
    loadJsonData('bdd/palabra.json').then((value) {
      listaPalabras.addAll(value);
      setState(() {
        palabraDisplay = filtrar(listaPalabras, widget.palabra, widget.idioma);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      palabraDisplay = filtrar(listaPalabras, widget.palabra, widget.idioma);
    });
    return Expanded(
      flex: 5,
      child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: palabraDisplay.length,
          itemBuilder: (context, index) {
            return Column(children: [
              index % 5 == 0 ? Publicidad_inferior() : Container(),
              GestureDetector(
                  onTap: () {
                    cont++;
                    if (cont == 2) {
                      cont = 0;
                      Public_pantalla_compl().cargaAd();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Info_palabra(palabras: palabraDisplay[index])));
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    child: Card(
                      elevation: 7.5,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                              widget.idioma == 'c'
                                  ? capitalizar(
                                      palabraDisplay[index].castellano)
                                  : capitalizar(palabraDisplay[index].guarani),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ]);
          }),
    );
  }
}
