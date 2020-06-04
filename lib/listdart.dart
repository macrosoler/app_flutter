/*
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'country.dart';
import 'package:http/http.dart' as http;


class CountyList extends StatelessWidget {
  final List<Country> country;
  final String title;

  Future<List<Country>> fetchNotes() async {
    var url = 'http://190.108.83.146:8080/Iprisco/LlenarArregloStock';
    //var url = 'http://190.108.83.146:8080/Iprisco/LlenarArregloStockParametros';

    var response = await http.get(url);

    var notes = List<Country>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Country.fromJson(noteJson));
      }
    }
    return notes;
  }
  //------



  CountyList({Key key, this.country, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  return Scaffold(

  body: _getBodyWidget(),
  );
  }


  Widget _getBodyWidget() {
          return Container(
    child: HorizontalDataTable(
          leftHandSideColumnWidth: 100,
          rightHandSideColumnWidth: 999,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: 100,
          rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 2.0,
          thickness: 0.0,
          ),
    ),

    //height: MediaQuery.of(CountyList).size.height,
  );
  }

  List<Widget> _getTitleWidget() {
  return [
  _getTitleItemWidget('Codigo', 60),
  _getTitleItemWidget('Categoria', 70),
  _getTitleItemWidget('Pais', 60),
  _getTitleItemWidget('Region', 85),
  _getTitleItemWidget('Bodega', 90),
    _getTitleItemWidget('Nombre', 199),
    _getTitleItemWidget('Origen', 199),
    _getTitleItemWidget('Formato', 60),
    _getTitleItemWidget('Anada', 80),
    _getTitleItemWidget('Precio US.', 60),

  ];
  }

  //Alto de toda la pantalla
  Widget _getTitleItemWidget(String label, double width) {
  return Container(
  child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
  width: width,
  height: 20,
  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
  alignment: Alignment.centerLeft,
  );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
  return Container(
  child: Text(country[index].codigo,),
  width: 100,
  height: 52,
  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
  alignment: Alignment.centerLeft,
  );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
  return Row(
  children: <Widget>[
    Container(
      child: Text(country[index].categoria),
      width: 70,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    ),
    Container(
      child: Text(country[index].pais),
      width: 70,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    ),
    Container(
      child: Text(country[index].region),
      width: 70,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    ),
    Container(
      child: Text(country[index].bodega),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    ),
    Container(
      child: Text(country[index].nombre),
      width: 200,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    ),
    Container(
      child: Text(country[index].origen),
      width: 200,
      height: 52,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.centerLeft,
    ),
    Container(
      child: Text(country[index].formato),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    ),
    Container(
      child: Text(country[index].anada),
      width: 50,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    ),
    Container(
      child: Text(country[index].precio),
      width: 50,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    ),
  ],
  );
  }
  }
*/
