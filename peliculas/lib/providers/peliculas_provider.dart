import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/models/actores_model.dart';
import 'package:peliculas/models/pelicula_model.dart';

class PeliculasProvider{

    String _apikey    = '4d4feb5e2ea88b014170fcec7f6cccc0';
    String _url       = 'api.themoviedb.org';
    String _language  = 'es-ES';


    int _popularesPage = 0;
    bool _cargando = false;

    List<Pelicula> _populares = new List();
    final _popularesStreamContoller = StreamController<List<Pelicula>>.broadcast();

    Function(List<Pelicula>) get popularesSink => _popularesStreamContoller.sink.add;

    Stream<List<Pelicula>> get popularesStream => _popularesStreamContoller.stream;

    void disposeStreams(){
      _popularesStreamContoller?.close();
    }

   Future<List<Pelicula>> getEnCines() async{


      final url = Uri.http(_url, '3/movie/now_playing',{
        'api_key':_apikey,
        'language':_language,
      });

      final resp = await  http.get(url);

      final decodedData = json.decode(resp.body);

      final peliculas = new Peliculas.fromJsonList(decodedData['results']);

      //print(peliculas.items[1].title);

      return peliculas.items;

    }
    Future<List<Pelicula>> getPopulares() async{

      if(_cargando) return[];
      _cargando = true;

      _popularesPage++;
      final url = Uri.http(_url, '3/movie/popular',{
        'api_key':_apikey,
        'language':_language,
        'page':_populares.toString(),
      });


      final resp = await  http.get(url);

      final decodedData = json.decode(resp.body);

      final peliculas = new Peliculas.fromJsonList(decodedData['results']);

      //print(peliculas.items[1].title);
      _populares.addAll(peliculas.items);

      popularesSink(_populares);

      _cargando = false;
      return peliculas.items;

    }

    Future<List<Actor>> getEnCast(String peliId) async{


      final url = Uri.http(_url, '3/movie/$peliId/credits',{
        'api_key':_apikey,
        'language':_language,
      });

      final resp = await  http.get(url);

      final decodedData = json.decode(resp.body);

      final cast = new Cast.fromJsonList(decodedData['cast']);

      //print(peliculas.items[1].title);

      return cast.actores;

    }

}