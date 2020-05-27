import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:limawine/album.dart';

class CardAlbum extends StatelessWidget {
  CardAlbum(this.album);
  Album album;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 144.0,
            width:500,
            color: album.color,
            child: Image.asset(album.image,height: 144.0, width: 160.0),
          ),
          padding(Text(album.title,style: TextStyle(fontSize: 18.0))),
          Row(children: <Widget>[
            padding(Icon(Icons.email)),
            padding(Text(album.name,style: TextStyle(fontSize: 18.0))),
          ],)
        ],
      ),
    );
  }

  Widget padding(Widget widget){
    return Padding(padding: EdgeInsets.all(7.0),child: widget);

  }
}
