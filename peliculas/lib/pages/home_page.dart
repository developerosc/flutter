import 'package:flutter/material.dart';
import 'package:peliculas/providers/peliculas_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/card_swiper_widget.dart';
import 'package:peliculas/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = PeliculasProvider();
  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cine'),
        centerTitle: false,
        backgroundColor:  Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                  showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      body: Container(
    child: Column(
     // mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      _swiperTarjetas(),
      _footer(context),
    ],
    ),
    )
    );
}
  Widget _swiperTarjetas() {

    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
       if(snapshot.hasData){
        return CardSwiper(
            peliculas: snapshot.data,
        );
        }else{
         return Container(
           height:  400.0,
           child: Center(
             child: CircularProgressIndicator(),
           )
         );
       }
        },
    );
    
    //peliculasProvider.getEnCines();
 

    //return CardSwiper(peliculas: [1, 2, 3, 4, 5]);

  }

  Widget _footer(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('populares',style: Theme.of(context).textTheme.subhead),
          SizedBox(height: 5.0),
          StreamBuilder(
              stream: peliculasProvider.popularesStream,
              builder: (BuildContext context , AsyncSnapshot<List> snapshot){

                if(snapshot.hasData){
                  return MovieHorizontal(peliculas: snapshot.data,siguientePagina: peliculasProvider.getPopulares,);
                }else{
                  return CircularProgressIndicator();
                }
              //  snapshot.data?.forEach( (p) => print(p.title));

              }),
        ],
      ),
    );
  }

}
