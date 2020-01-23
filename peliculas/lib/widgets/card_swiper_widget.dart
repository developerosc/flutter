import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/models/pelicula_model.dart';


class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({
    @required
   this.peliculas
});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){

          peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';
          return
            Hero(tag: peliculas[index].uniqueId,
                child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/img/loading.gif'),
                image: NetworkImage(peliculas[index].getPosterImg())
            ),
              onTap: (){
                //Navigator.pushNamed(context, 'detalle',arguments: pelicula);
                Navigator.pushNamed(context, 'detalle',arguments: peliculas[index]);
              },
            ),
            //Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover,),
          ),
          );
        },
        itemCount: peliculas.length,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
        //    pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
