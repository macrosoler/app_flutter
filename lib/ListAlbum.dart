import 'package:flutter/material.dart';
import 'dart:async';

class ListAlbum extends StatefulWidget {
  @override
  _ListAlbumState createState() => _ListAlbumState();
}


//State is information of the application that can change over time or when some actions are taken.
class _ListAlbumState extends State<ListAlbum>{

  /*
  1. Create a directory called images and add your image there
  2. In pubspec.yamp add dependency for using assets
  */

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Contactanos'),
        backgroundColor: Colors.red[900],
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        color: Colors.white,
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Image.asset('images/tarjetas.png'),
              //this image was outside the screen so we are using Expanded which will fit the image into the screen
            ],
          ),
        ),
      ),
    );
  }
}
