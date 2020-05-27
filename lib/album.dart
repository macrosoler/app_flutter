
import 'dart:ui';
import 'package:flutter/material.dart';

class Album{
  String title;
  String name;
  Color color;
  String image;
  Album(this.title,this.name,this.image,this.color);

  static List<Album> albums(
      ){
    return[Album("Nightmare", "Avenger Soldado", "images/tarjetas.png",Colors.blueGrey),
      Album("Epicao", "Avenger Soldado", "images/casa.png",Colors.deepOrange),
      Album("Sechura", "Avenger Soldado", "images/casa.png",Colors.blueGrey),
      Album("LimaWine", "Avenger Soldado", "images/casa.png",Colors.deepOrange),
      Album("COVID-19", "Avenger Soldado", "images/casa.png",Colors.blueGrey)];
  }
}