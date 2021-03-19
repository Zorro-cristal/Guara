import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class SugerenciaHome extends StatefulWidget {
  @override
  Sugerencia createState() => Sugerencia();
}

class Sugerencia extends State<SugerenciaHome> {
  List<String> attachments = [];
  bool isHTML = false;

  final _subjectController = TextEditingController(
    text: 'Aporte para proyecto Guara'
  );

  final _bodyController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: ["zorro201021@hotmail.com"],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    /*_scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Opinion o Sugerencia'),
          //actions: <Widget>[],
        ),
        body: SafeArea(child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[100]
          ),
          child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(height: 30,),
                Card (child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _subjectController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Asunto',
                    ),
                  ),
                ),),
                Container(
                  height: 20,
                ),
                Card(elevation:10,child: 
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _bodyController,
                    maxLines: 15,
                    decoration: InputDecoration(
                        labelText: 'Mensaje', border: OutlineInputBorder()),
                  ),
                ),),
                Container(height: 250),
                /*CheckboxListTile(
                  title: Text('HTML'),
                  onChanged: (bool value) {
                    setState(() {
                      isHTML = value;
                    });
                  },
                  value: isHTML,
                ),
                ...attachments.map(
                  (item) => Text(
                    item,
                    overflow: TextOverflow.fade,
                  ),
                ),*/
              ],
            ),
          ),
        ),
        ),),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.send),
          onPressed: send,
        ),
    );
  }
}