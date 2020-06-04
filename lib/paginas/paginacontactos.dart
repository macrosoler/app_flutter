import 'package:flutter/material.dart';
class PaginaContactos extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<PaginaContactos> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text('Contactanos..!'),
        backgroundColor: Colors.blueGrey,
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Hello World'),
                      new Text('How are you?')
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Hello World'),
                      new Text('How are you?')
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Hello World'),
                      new Text('How are you?')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

