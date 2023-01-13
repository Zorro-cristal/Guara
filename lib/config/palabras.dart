class Palabra {
  String castellano;
  String guarani;

  Palabra({required this.guarani, required this.castellano});

  factory Palabra.fromJson(Map<String, dynamic> json) {
    return Palabra(
      guarani: json['guarani'] as String,
      castellano: json['castellano'] as String,
    );
  }
}
