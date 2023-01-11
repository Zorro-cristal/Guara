import 'package:flutter/material.dart';
import '../../lib2/screen/presentacion.dart';
import '../../lib2/screen/saludos.dart';
import '../../lib2/screen/sugerencias.dart';

import 'cortesia.dart';
import 'direcciones.dart';
import 'momentos.dart';

class Frases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mburucuya.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35)
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => SaludosHome())
                    );
                  },
                  //textColor: Colors.black,
                  //padding: const EdgeInsets.all(8.0),
                  child:
                    Text(
                    "Saludos",
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
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35)
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => PresentacionHome())
                    );
                  },
                  //textColor: Colors.black,
                  //padding: const EdgeInsets.all(8.0),
                  child:
                    Text(
                    "Presentaciones",
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
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35)
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => CortesiaHome())
                    );
                  },
                  //textColor: Colors.black,
                  //padding: const EdgeInsets.all(8.0),
                  child:
                    Text(
                    "Expresiones de cortesía",
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
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35)
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => MomentosHome())
                    );
                  },
                  //textColor: Colors.black,
                  //padding: const EdgeInsets.all(8.0),
                  child:
                    Text(
                    "Momentos del día",
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
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35)
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => DireccionesHome())
                    );
                  },
                  //textColor: Colors.black,
                  //padding: const EdgeInsets.all(8.0),
                  child:
                    Text(
                    "Direcciones",
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

          ],
        ),
      ),),
    );
  }
  
}