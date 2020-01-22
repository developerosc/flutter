import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peliculas/models/actores_model.dart';
import 'package:peliculas/models/pelicula_model.dart';
import 'package:peliculas/providers/peliculas_provider.dart';

class PeliculaDetalle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
            _crearAppbar(pelicula),
            SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 10.0),
                    _posterTirulo(pelicula),
                    _description(pelicula),
                    _crearCasting(pelicula),
                  ]
                )),
        ],
      )
    );
  }

  Widget _crearAppbar(Pelicula pelicula) {

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor:  Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title
        ),
        background: FadeInImage(
            placeholder: AssetImage('asset/img/loading.gif'),
            image: NetworkImage(pelicula.getBackgraundImg()),
            fit: BoxFit.cover,
      ),
      
    ),
    );

  }

  Widget _posterTirulo(Pelicula pelicula) {
    
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
          child: Image(
              image: NetworkImage(pelicula.getPosterImg()),
              height: 150.0,

          ),

          ),
          SizedBox(width: 20.0,),
          Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(pelicula.title),
                  Text(pelicula.originalTitle),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star_border),
                      Text(pelicula.voteAverage.toString()),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
    
  }

  Widget _description(Pelicula pelicula) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
      child: Text(pelicula.overview,textAlign: TextAlign.justify,),
    );

  }

  Widget _crearCasting(Pelicula pelicula) {

    final peliProvider = new PeliculasProvider();
    
    
    return FutureBuilder(
        future: peliProvider.getEnCast(pelicula.id.toString()),
        builder: (context, AsyncSnapshot<List> snapshot){
              if(snapshot.hasData) {
                return _crearActoresPageView(snapshot.data);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
    }
        );
        
  }

  Widget _crearActoresPageView(List<Actor> actores) {

    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1),
          itemCount: actores.length,
          itemBuilder: (context, i){
          
          return _actorTarjeta(actores[i]);
          }),

    );
  }

  Widget _actorTarjeta(Actor actor){
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child:
          FadeInImage(
            height: 150.0,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/img/no-image'),
              image: NetworkImage(actor.getFoto())

          ),
          ),
          Text(actor.name)
        ],
      ),
    );
  }
}
