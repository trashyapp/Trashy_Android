import 'package:flutter/material.dart';
import './home.dart';

void main()  {
  runApp(CameraApp());
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {

  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Title',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomeRoute(),
    );

  }

}