/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'country.dart';


class CountyList extends StatelessWidget {
  final List<Country> country;
  CountyList({Key key, this.country}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: country == null ? 0 : country.length,
        itemBuilder: (BuildContext context, int index) {
          return
            new Card(
              child: new Container(
                child: new Center(
                    child: new Column(
                      // Stretch the cards in horizontal axis
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].codigo,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),

                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].categoria,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].pais,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),

                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].region,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),

                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].bodega,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),

                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].nombre,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),

                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].origen,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),

                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].formato,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),

                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].anada,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),

                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].precio,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),


                      ],
                    )),
                padding: const EdgeInsets.all(15.0),
              ),
            );
        });
  }
}
*/
