class Paquete_google_search {
  String? titulo;
  String? url;
  String? snippet;

  Paquete_google_search({this.titulo, this.url, this.snippet});

  String? definicion() {
    if (this.snippet != null) {
      return this.snippet;
    } else {
      return "Definicion no encontrada.";
    }
  }
}
