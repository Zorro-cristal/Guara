import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guara/screen/espanholguara.dart';
import 'package:guara/screen/frases.dart';
import 'package:guara/screen/guaraniespanhol.dart';
import 'package:guara/screen/numeros.dart';
import 'package:guara/screen/presentacion.dart';
import 'package:guara/screen/sugerencias.dart';

class Principal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/principal.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[  
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35)
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => EspanholGuaraniHome())
                    );
                  },
                  textColor: Colors.black,
                  //padding: const EdgeInsets.all(8.0),
                  child:
                    Text(
                    "Castellano a Guarani",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                //)
                ),
              ),
            ]),
            Container(
              height: 10,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                //width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35)
                ),
                child: FlatButton(
                  onPressed: () {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => GuaraniEspanholHome())
                  );
                },
                textColor: Colors.black,
                //padding: const EdgeInsets.all(8.0),
                child:
                  Text(
                    "Guaranigui Castellanope",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ),
            ],
          ),
          Container(
              height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35)
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => NumerosHome())
                    );
                  },
                  textColor: Colors.black,
                  //padding: const EdgeInsets.all(8.0),
                  child:
                    Text(
                    "Numeros/Papaha",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                //)
                ),
              ),
            ]),
          Container(
              height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35)
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => Frases())
                    );
                  },
                  textColor: Colors.black,
                  //padding: const EdgeInsets.all(8.0),
                  child:
                    Text(
                    "Frases Comunes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                //)
                ),
              ),
            ]),
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35)
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => SugerenciaHome())
                    );
                  },
                  textColor: Colors.black,
                  //padding: const EdgeInsets.all(8.0),
                  child:
                    Text(
                    "Sugerencias",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                //)
                ),
              ),
            ]),
            Container(height: 35),
        ],
      ),
        ),
      )   
    );
  }
}