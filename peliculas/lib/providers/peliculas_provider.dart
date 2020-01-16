import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/models/pelicula_model.dart';

class PeliculasProvider{

    String _apikey    = '4d4feb5e2ea88b014170fcec7f6cccc0';
    String _url       = 'api.themoviedb.org';
    String _language  = 'es-ES';


   Future<List<Pelicula>> getEnCines() async{


     final url = Uri.http(_url, '3/movie/popular',{
       'api_key':_apikey,
       'language':_language,
     });

    final resp = await  http.get(url);

    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    //print(peliculas.items[1].title);

     return peliculas.items;

    }

}