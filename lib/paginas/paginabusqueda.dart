import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:limawine/entities/note.dart';


class PaginaBuscar extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<PaginaBuscar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busqueda por Campos',
      debugShowCheckedModeBanner: false,
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
  List<String> names = [""];
  List<String> categorias = [""];


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

  void fetchCategoria() async {
    var url = "http://190.108.83.146:8080/Iprisco/LlenarCategoria";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var categoriaJson = json.decode(response.body);
      for (var categoriaJson in categoriaJson) {
        setState(() {
          categorias.add(categoriaJson["categoria"]);
        });
      }
    } else {
      print("statusCode: ${response.statusCode.toString()}");
    }
  }

  //Pais
  void fetchCountries(String categoria) async {
    var url = "http://190.108.83.146:8080/Iprisco/LlenarPaisxCategoria?categoria=$categoria";
    //var url = "http://190.108.83.146:8080/Iprisco/LlenarPais";

    ///limpia lista de paises
    setState(() {
      countries = [""];
    });

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var countriesJson = json.decode(response.body);
      for (var countryJson in countriesJson) {
        setState(() {
          countries.add(countryJson["pais"]);
        });
      }
    } else {
      print("statusCode: ${response.statusCode.toString()}");
    }
  }
  //Nombres
  void fetchNombre(String categoria,pais) async {
    var url = "http://190.108.83.146:8080/Iprisco/LlenarNombrexPais?categoria=$categoria&pais=$pais";
    ///limpia lista de paises
    setState(() {
      names = [""];
    });

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var namesJson = json.decode(response.body);
      for (var nameJson in namesJson) {
        setState(() {
          names.add(nameJson["nombre"]);
        });
      }
    } else {
      print("statusCode: ${response.statusCode.toString()}");
    }
  }
  //Hasta aqui Nombres

  @override
  void initState() {
    super.initState();
    fetchCategoria();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(searchContainerExpanded ? 'Busqueda' : 'Productos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(searchContainerExpanded ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (searchContainerExpanded) {
                  searchContainerExpanded = false;
                } else {
                  searchContainerExpanded = true;
                }
              });
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
          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  labelText: "Selecciona una Categoria",
                ),
                isEmpty: paramCategoria == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text('Seleccionar Categoria'),
                    value: paramCategoria,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        paramCategoria = newValue;
                        paramPais = "";
                      });

                      ///realiza fetch de paises por categoria
                      fetchCountries(paramCategoria);
                    },
                    /*onChanged: (String newValue) {
                      setState(() {
                        paramCategoria = newValue;
                      });

                      ///realiza fetch de paises por categoria
                      fetchCountries(paramCategoria);
                    },*/
                    items: categorias.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),

          /*TextFormField(
            decoration: InputDecoration(
                hintText: 'Ingresa la Categoria', labelText: 'Busqueda por Categoria:'),
            controller: paramCategoriaController,
          ),*/

          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  labelText: "Selecciona un Pais",
                ),
                isEmpty: paramPais == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text('Seleccionar pais'),
                    value: paramPais,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        paramPais = newValue;
                      });
                    },
                    items: countries.isNotEmpty ? countries.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList() : [
                      DropdownMenuItem(
                        value: '',
                        child: Text("No hay paises disponibles"),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
//---------------
          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  labelText: "Selecciona un Nombre",
                ),
                isEmpty: paramNombre == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text('Seleccionar nombre'),
                    value: paramNombre,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        paramNombre = newValue;
                      });
                    },
                    items: names.isNotEmpty ? names.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList() : [
                      DropdownMenuItem(
                        value: '',
                        child: Text("No hay nombres disponibles"),
                      )
                    ],
                  ),
                ),
              );
            },
          ),


//--------------
           /*TextFormField(
             decoration: InputDecoration(
                 hintText: 'Ingresa el nombre', labelText: 'Busqueda por nombre:'),
             controller: paramNombreController,
           ),*/
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Ingresa la Bodega', labelText: 'Busqueda por Bodega:'),
            controller: paramBodegaController,
          ),

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
                            "Buscar productos".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.red[900],
                          elevation: 12,
                          onPressed: () async {
                            ///Cierra el teclado
                            FocusScope.of(context).requestFocus(FocusNode());

                            ///Verifica que el campo 'Nombre' no este vacio
                            /* if (paramNombreController.text.isEmpty) {
                               Scaffold.of(context).showSnackBar(SnackBar(
                                 content: Text("Debe agregar un nombre"),
                               ));
                               return;
                             }*/

                            ///muestra el widget 'circularLoader'
                            setState(() {
                              isFetching = true;
                            });

                            ///realiza el request al API
                            // await fetchNotes(paramPaisController.text)
                            await fetchNotes(paramCategoria,paramPais,paramNombre,paramBodegaController.text).then((value) {
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
              rightHandSideColumnWidth: 740,
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
      _getTitleItemWidget('Categoria', 89),
      _getTitleItemWidget('Pais', 65),
      _getTitleItemWidget('Region', 110),
      _getTitleItemWidget('Bodega', 135),
      _getTitleItemWidget('Nombre', 200),
   /*   _getTitleItemWidget('Origen', 199),
      _getTitleItemWidget('Formato', 70),*/
      _getTitleItemWidget('Anada', 55),
      _getTitleItemWidget('Precio', 85),
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
          width: 85,
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
       /* Container(
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
        ),*/
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
