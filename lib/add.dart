import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

var tonnen = {
  'Biomüll': 'Bio',
  'Verpackungsmüll': 'Verpackung',
  'Glascontainer': 'Glas',
  'Pfandautomat': 'Pfand',
  'Papiermüll': 'Papier',
  'Restmüll': 'Rest'
};

class AddPage extends StatefulWidget {

  final String barcode;

  AddPage({this.barcode});

  _AddPageState createState() => new _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String dropdownValue = 'Biomüll';
  String productname = '';

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Produkt hinzufügen"),
        backgroundColor: Color(0xff1da5e9),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  autofocus: true,
                  cursorColor: Colors.blue,
                  maxLength: 100,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  onChanged: (newvalue) {
                    productname = newvalue;
                  },
                  controller: _textController,
                ),
              ),
              SizedBox(height: 15),
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Biomüll', 'Verpackungsmüll', 'Glascontainer', 'Pfandautomat', 'Papiermüll', 'Restmüll']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(fontSize: 18)),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              RaisedButton(
                color: Colors.blue,
                child: Text('Hinzufügen', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (productname.length == 0) {
                    _displayMessage('Bitte lege einen Produkt Namen fest');
                  } else {
                    Firestore.instance.collection("products").document(widget.barcode.trim()).setData({
                      "name": productname,
                      "trash": tonnen[dropdownValue]
                    });
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  _displayMessage(String msg) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg, textAlign: TextAlign.center),
    ));
  }
  Future<String> getData(barcode) async {
    http.Response response = await http.get('https://barcodedata.glitch.me/?barcode=' + barcode);
    this.setState(() {
      Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey('title')) {
        _textController.text = data['title'];
        productname = data['title'];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData(widget.barcode.trim());
  }
}