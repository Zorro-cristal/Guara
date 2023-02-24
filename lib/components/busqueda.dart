import 'package:flutter/material.dart';
import 'package:googleapis/customsearch/v1.dart';
//import 'package:googleapis_auth/auth_browser.dart' as auth;
import 'package:googleapis_auth/auth_io.dart';

import '../modelos/paquete_google_serch.dart';

class Busqueda extends StatefulWidget {
  String palabra;
  Busqueda({super.key, required this.palabra});

  @override
  State<Busqueda> createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  final api_key_token = "AIzaSyA-Y0jGsB1VD6Up52ywPfc3eCkvfrQ-btw";

  final motor_busqueda = "e0960a4b00731497f";

  final link =
      "https://customsearch.googleapis.com/customsearch/v1?q=londres&key=AIzaSyA-Y0jGsB1VD6Up52ywPfc3eCkvfrQ-btw&cx=e0960a4b00731497f";

  String deficinion = "";
  String imagen = "";
  bool sustant = false;

  // Retorna el primer resultado
  Future<void> busquedaApi() async {
    var resultado;
    print("Iniciando busqueda");
    var cliente = clientViaApiKey(api_key_token);
    var api = new CustomSearchApi(cliente);
    var buscador = api.cse
        .list(cx: motor_busqueda, q: widget.palabra, hl: "es", hq: "definicion", siteSearch: "rae.es", siteSearchFilter: "i")
        .then((Search busq) {
      if (busq.items != null) {
        // Obtenemos el primer resultado
        resultado = Paquete_google_search(
            titulo: busq.items![0].title,
            url: busq.items![0].link,
            snippet: busq.items![0].snippet);
        setState(() {
          deficinion = resultado.definicion();
        });
        for (var result in busq.items!) {
          print(result.snippet);
          if (!sustant &&
              (result.snippet!.contains("sustantivo") ||
                  result.snippet!.contains("sust"))) {
            print(result.snippet);
            setState(() {
              sustant = true;
            });
          }
        }
        print(sustant);
      }
    });
    buscador = api.cse
        .list(
            cx: motor_busqueda,
            q: widget.palabra,
            hl: "es",
            hq: "fotos",
            searchType: "image", imgSize: "large")
        .then((Search busq) {
      if (busq.items != null) {
        resultado = Paquete_google_search(
            titulo: busq.items![0].title,
            url: busq.items![0].link,
            snippet: busq.items![0].snippet);
        setState(() {
          imagen = resultado.url;
        });
      }
    });
  }

  @override
  void initState() {
    busquedaApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue,
        child: Column(children: [
          Text(deficinion),
          imagen != "" && imagen != null ? Image.network(imagen) : Container(),
        ]));
  }
}
