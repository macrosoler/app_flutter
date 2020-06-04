import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    // Las Acciones de nuestro AppBar, el icono cancelar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono de la izauierda que querramos poner
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // sugerencias que aparecen cuando se escribe
    return Container();
  }

  
}