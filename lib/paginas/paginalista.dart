/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:limawine/entities/note.dart';
import 'package:limawine/search/search_delegate.dart';

class PaginaLista extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<PaginaLista> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lima Wine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> _notes = List<Note>();
  bool searchContainerExpanded = true;
  bool isFetching = false;
  String paramCategoria = "";
  String paramPais = "";
  String paramNombre = "";
  String paramBodega = "";
  List<String> countries = [""];

  TextEditingController paramPaisController = TextEditingController();
  TextEditingController paramCategoriaController = TextEditingController();
  TextEditingController paramNombreController = TextEditingController();
  TextEditingController paramBodegaController = TextEditingController();

  Future<List<Note>> fetchNotes(String categoria, String pais, String nombre, String bodega) async {
    var url = "http://190.108.83.146:8080/Iprisco/LlenarArregloStockParametros";
    var response = await http.post(url, body: {
      'categoria': '$categoria',
      'pais': '$pais',
      'nombre': '$nombre',
      'bodega': '$bodega',
    });
    var notes = List<Note>();
    //para que sea interactivo.
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    } else {
      print("statusCode: ${response.statusCode.toString()}");
    }
    return notes;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(searchContainerExpanded ? 'Recuperar Productos' : 'Lista de Productos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
             showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            searchForm(),
            _getBodyWidget(),
          ],
        ),
      ),
    );
  }

  Widget searchForm() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: searchContainerExpanded ? 500 : 0,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: isFetching
                ? Center(
              child: CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation<Color>(Colors.red[900]),
              ),
            )
                : Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    child: Text(
                      "Recuperar Productos".toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red[900],
                    elevation: 14,
                    onPressed: () async {
                      ///Cierra el teclado
                      FocusScope.of(context).requestFocus(FocusNode());
                      ///muestra el widget 'circularLoader'
                      setState(() {
                        isFetching = true;
                      });

                      ///realiza el request al API
                      // await fetchNotes(paramPaisController.text)
                      await fetchNotes(paramCategoriaController.text,paramPais,paramNombreController.text,paramBodegaController.text).then((value) {
                        setState(() {
                          _notes.clear();
                          _notes.addAll(value);
                          isFetching = false;
                          searchContainerExpanded = false;
                        });
                      }).catchError((error) {
                        print("error fetching data: $error");
                        setState(() {
                          isFetching = false;
                        });
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBodyWidget() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: searchContainerExpanded
          ? 0
          : MediaQuery.of(context).size.height - AppBar().preferredSize.height,
      child: _notes.isNotEmpty
          ? HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 999,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: _notes.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 2.0,
          thickness: 0.0,
        ),
      )
          : Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "No encontramos productos en tu busqueda, por favor intenta nuevamente o cambia los criterios de busqueda.",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.justify,
          ),
        ),
      ),

      //height: MediaQuery.of(CountyList).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Codigo', 100),
      _getTitleItemWidget('Categoria', 83),
      _getTitleItemWidget('Pais', 65),
      _getTitleItemWidget('Region', 110),
      _getTitleItemWidget('Bodega', 135),
      _getTitleItemWidget('Nombre', 230),
      _getTitleItemWidget('Origen', 199),
      _getTitleItemWidget('Formato', 70),
      _getTitleItemWidget('Anada', 55),
      _getTitleItemWidget('Precio', 52),
    ];
  }

  //Alto de toda la pantalla
  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      width: width,
      color: Colors.red[900],
      height: 20,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(_notes[index].codigo),
      width: 90,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(_notes[index].categoria),
          width: 75,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(_notes[index].pais),
          width: 70,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(_notes[index].region),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(_notes[index].bodega),
          width: 140,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(_notes[index].nombre),
          width: 220,
          height: 52,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(_notes[index].origen),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(_notes[index].formato),
          width: 70,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(_notes[index].anada),
          width: 50,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(_notes[index].precio),
          width: 60,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
*/
