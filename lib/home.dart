import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import './result.dart';
import './details.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => new _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Trashy"),
        backgroundColor: Color(0xff1da5e9),
      ),
      body: SafeArea(
        child: Center(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: InkWell(
                    highlightColor: Colors.blue.withAlpha(30),
                    splashColor: Colors.blue.withAlpha(80),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(tonne: items[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(items[index], style: TextStyle(fontSize: 20))
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: barcodeScanning,
        child: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
        tooltip: "Barcode scannen",
        foregroundColor: Color(0xff1da5e9)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  _displayMessage(String msg) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg, textAlign: TextAlign.center),
    ));
  }

  Future barcodeScanning() async {
    try {
      String barcode = await BarcodeScanner.scan();
      if (int.tryParse(barcode).isNaN) {
        _displayMessage('Bitte scanne einen Barcode (Nur zahlen)');
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(barcode: barcode),
          ),
        );
      }
    } catch (e){

    }
  }
}

var items = [
  'Mülltrennung',
  'Verpackungsmüll',
  'Papiermüll',
  'Biomüll',
  'Restmüll',
  'Pfandautomat',
  'Glascontainer',
  'PET',
  'Sekundärrohstoffe'
];