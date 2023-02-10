import 'package:flutter/material.dart';
import 'package:guara2/screen/frases/cortesia.dart';
import 'package:guara2/screen/frases/direcciones.dart';
import 'package:guara2/screen/frases/tiempos.dart';
import 'package:guara2/screen/principal/espanholguara.dart';
import 'package:guara2/screen/menus/frases.dart';
import 'package:guara2/screen/principal/guara_espanhol.dart';
import 'package:guara2/screen/frases/presentaciones.dart';
import 'package:guara2/screen/menus/principal.dart';
import 'package:guara2/screen/frases/saludos.dart';
import 'package:guara2/screen/principal/sugerencias.dart';

void navegar(context, String destino) {
  switch (destino) {
    case 'EspanholGuarani':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => EspanholGuara())
      );
      break;
    case 'GuaraniEspanhol':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => GuaraEspanhol())
      );
      break;
    case 'NumerosHome':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => EspanholGuara())
      );
      break;
    case 'Frases':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Frases())
      );
      break;
    case 'Sugerencia':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Sugerencia())
      );
      break;
    case 'Saludos':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Saludos())
      );
      break;
    case 'Presentaciones':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Presentaciones())
      );
      break;
    case 'Cortesia':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Cortesia())
      );
      break;
    case 'Tiempos':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Tiempos())
      );
      break;
    case 'Direcciones':
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Direcciones())
      );
      break;
    default:
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Principal())
      );
  }
}