class Palabra {
  String castellano;
  String guarani;

  Palabra({required this.guarani, required this.castellano});

  Palabra.fromJson(Map<String, dynamic> json)
      : castellano = json['castellano'] != null ? json['castellano'] as String : 'null',
        guarani = json['guarani'] != null ? json['guarani'] as String : 'null';

  Map<String, dynamic> toJson() => {
        'castellano': castellano,
        'guarani': guarani,
      };

  /* factory Palabra.fromJson(Map<String, dynamic> json) {
    var pal = Palabra(
      guarani: json['guarani'] != null ? json['guarani'] as String : 'null',
      castellano:
          json['castellano'] != null ? json['castellano'] as String : 'null',
    );
    return pal;
  } */
}
