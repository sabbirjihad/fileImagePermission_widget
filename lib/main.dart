import 'dart:ffi';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Image file",
    theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
    ),
    home: Scaffold(
      appBar: AppBar(title: Text('Image.file')),
      body:  myapp(),
    )

  ));
}
class myapp extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  String filePath='';
  Future <void> checkPermission() async {
    if(await Permission.storage.request().isGranted){
      setState(() {
        filePath='/storage/emulated/0/Pictures/IMG_20210818_230123_1.jpg';
      });
  }
 else
  {
    await Permission.storage.request();
  }
  }

  @override
  Widget build(BuildContext context) {
    checkPermission();
    return Container(
        height: 300,
        width: 300,
        color: Colors.grey,
        child: Image.file(File(filePath)),
    );
  }
}


