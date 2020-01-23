import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula_model.dart';
import 'package:peliculas/providers/peliculas_provider.dart';


class DataSearch extends SearchDelegate {


  final perliculasProvider = new PeliculasProvider();



  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: las acciones del appBar
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        //print('Click');
        query = '';
      }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: Icono a la izquierda
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Crea los resultados que se van a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: las sugerencias
    return FutureBuilder(
        future: perliculasProvider.buscarPelicula(query),
        builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot){

          if(snapshot.hasData){

            final peliculas = snapshot.data;
            return ListView(
              children: peliculas.map((pelicula){
                return ListTile(
                    leading: FadeInImage(
                        placeholder: AssetImage('assets/img/no-image.jpg'), 
                        image: NetworkImage(pelicula.getPosterImg())
                    ),
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.originalTitle),
                  onTap: (){
                      pelicula.uniqueId = '';
                      Navigator.pushNamed(context, 'detalle',arguments: pelicula);
                  },
                );

              }).toList()
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );

          }

        });
  }


}