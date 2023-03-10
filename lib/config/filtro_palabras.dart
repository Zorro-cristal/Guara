import 'package:guara2/modelos/palabras.dart';

List<Palabra> filtrar(List<Palabra> origin, String filtro, String idioma) {
  if (idioma == 'c') {
    return origin
        .where((element) => element.castellano.toLowerCase().contains(filtro))
        .toList();
  } else {
    return origin
        .where((element) => element.guarani.toLowerCase().contains(filtro))
        .toList();
  }
}
