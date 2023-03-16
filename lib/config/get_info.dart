import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:guara/modelos/palabras.dart';

Future<List<Palabra>> loadJsonData(String ruta) async {
  List<Palabra> palabras = List.empty(growable: true);
  var response = await rootBundle.loadString(ruta);
  var datasJson = json.decode(response);
  for (var dataJson in datasJson) {
    palabras.add(Palabra.fromJson(dataJson));
  }
  return palabras;
}
