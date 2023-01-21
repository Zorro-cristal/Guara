import 'package:flutter/material.dart';
import 'package:guara2/screen/espanholguara.dart';
import 'package:guara2/screen/principal.dart';
import 'package:guara2/screen/sugerencias.dart';

void navegar(context, String destino) {
  switch (destino) {
    case 'EspanholGuarani':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => EspanholGuara())
      );
      break;
    case 'GuaraniEspanhol':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => EspanholGuara())
      );
      break;
    case 'NumerosHome':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => EspanholGuara())
      );
      break;
    case 'Frases':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => EspanholGuara())
      );
      break;
    case 'Sugerencia':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Sugerencia())
      );
      break;
    default:
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Principal())
      );
  }
}