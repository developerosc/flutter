import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {


  final  List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController = new PageController(

    initialPage: 1,
  viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener((){

      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        //print('Cargar siguientes pelis');
        siguientePagina();
      }
    });
    return Container(

      height: _screenSize.height * 0.3,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        //children: _tarjetas()
        itemCount: peliculas.length,
        itemBuilder: (context,i){
            return _tarjeta(context, peliculas[i]);
        },
      ),
    );
  }

  Widget _tarjeta(BuildContext context , Pelicula pelicula){
    final tarjeta = Container(
      margin:  EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child : FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(pelicula.getPosterImg()),
                fit: BoxFit.fill,
                height: 160.0,
              )
          ),
          Text(
            pelicula.title,overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: (){
        print('pelicula ${pelicula.title}');
        Navigator.pushNamed(context, 'detalle',arguments: pelicula);
      },
    );

  }

  List<Widget> _tarjetas() {

    return peliculas.map((pelicula){

      return Container(
        margin:  EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child : FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(pelicula.getPosterImg()),
              fit: BoxFit.fill,
              height: 160.0,
            )
      ),
            Text(
              pelicula.title,overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );

    }).toList();


  }
}
