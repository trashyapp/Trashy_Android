import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './add.dart';
import './details.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Tonne {
  final String name;
  final String icon;

  Tonne({this.name, this.icon});
}

var tonnen = {
  'Bio': new Tonne(name: 'Biomüll', icon: 'Bio_Ergebnis.png'),
  'Verpackung': new Tonne(name: 'Verpackungsmüll', icon: 'Verpackung_Ergebnis.png'),
  'Glas': new Tonne(name: 'Glascontainer', icon: 'Glas_Ergebnis.png'),
  'Pfand': new Tonne(name: 'Pfandautomat', icon: 'Pfand_Ergebnis.png'),
  'Papier': new Tonne(name: 'Papiermüll', icon: 'Papier_Ergebnis.png'),
  'Rest': new Tonne(name: 'Restmüll', icon: 'Restmüll_Ergebnis.png')
};

class ResultPage extends StatefulWidget {
  final String barcode;
  ResultPage({this.barcode});

  @override
  _ResultPageState createState() => new _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  String desc = '';

  @override
  Widget build(BuildContext context) {
    String barcode = widget.barcode.trim();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ergebnis"),
        backgroundColor: Color(0xff1da5e9),
      ),
      body: SafeArea(
          child: Center(
            child: FutureBuilder(
                future: Firestore.instance.collection("products").document(barcode).get(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error: " + snapshot.error.toString(), style: TextStyle(fontSize: 30));
                  } else if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else if (snapshot.data.exists) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(snapshot.data.data['name'], style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        SizedBox(
                          child: Text(
                              desc,
                              textAlign: TextAlign.center
                          ),
                          width: 330,
                        ),
                        SizedBox(height: 30),
                        Image.asset('assets/' + tonnen[snapshot.data.data['trash']].icon, height: 150),
                        SizedBox(height: 10),
                        Text(tonnen[snapshot.data.data['trash']].name, style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
                        SizedBox(height: 10),
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text('Mehr zum ' + tonnen[snapshot.data.data['trash']].name),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(tonne: tonnen[snapshot.data.data['trash']].name),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return Card(
                      child: InkWell(
                        splashColor: Colors.lightBlue.withAlpha(50),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const ListTile(
                              title: Text("Der gescannte Barcode ist nicht in der Datenbank vorhanden."),
                              subtitle: Text("Möchtest du einen Eintrag erstellen?"),
                            ),
                            ButtonTheme.bar(
                              child: ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                    child: const Text('NEIN'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  FlatButton(
                                    child: const Text('JA'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddPage(barcode: barcode),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
            ),
          ),
      ),
    );
  }
  Future<String> getData(barcode) async {
    http.Response response = await http.get('https://barcodedata.glitch.me/?barcode=' + barcode);
    this.setState(() {
      Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey('description')) {
        desc = data['description'].length > 100 ? data['description'].substring(0, 93) : data['description'];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData(widget.barcode.trim());
  }
}
