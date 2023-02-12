import 'package:flutter/material.dart';

BoxDecoration Fondo_pantalla(pantalla) {
  switch (pantalla) {
    case "principal":
      return BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/principal.jpg"),
              fit: BoxFit.cover));
    case "frases":
      return BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/mburucuya.jpg"),
              fit: BoxFit.cover));
    case "info_castellano":
      return BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/definicion.jpg"),
              fit: BoxFit.cover));
    case "info_guarani":
      return BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/mburucuya.jpg"),
              fit: BoxFit.cover));
    default:
      return BoxDecoration();
  }
}
