import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:limawine/ListAlbum.dart';
import 'package:limawine/paginas/paginabusqueda.dart';
import 'package:limawine/paginas/paginacliente.dart';
import 'package:limawine/paginas/paginainicio.dart';
import 'package:limawine/paginas/paginalista.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final PaginaInicio _listaInicio = PaginaInicio();
  //final PaginaCliente _listaClientes = PaginaCliente();
 // final PaginaLista _listaLista = PaginaLista();
  final ListAlbum _listAlbum = ListAlbum();
  final PaginaBuscar _listaBuscar = PaginaBuscar();

  Widget _showPage = new PaginaInicio();

  Widget _pageChooser(int page){
      switch (page){
        case 0:
          return _listaInicio;
          break;
        /*case 1:
          return _listaLista;
          break;*/
        case 1:
          return _listaBuscar;
          break;
       /* case 3:
          return _listaClientes;
          break;*/
        case 2:
          return _listAlbum;
          break;
        default:
          return new Container(
            child: new Center(
              child: new Text('No ha Seleccionado Pagina!!',
                    style: new TextStyle(fontSize: 30),
              )
            ),
          );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            //Icon(Icons.list, size: 30),
            Icon(Icons.search, size: 30),
            //Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.red[900],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.transparent,
          child: Center(
                child: _showPage,
            ),
          ),
        );
  }
}
