import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrreaderapp/models/scan_model.dart';
import 'package:latlong/latlong.dart';


class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.my_location),
              onPressed: (){

              }
          )

        ],
      ),
      body: _crearFlutterMap(scan)
    );
  }

  Widget _crearFlutterMap(ScanModel scan) {

    return FlutterMap(
        options: MapOptions(
          center: scan.getLatLng()
        ),
    );

  }
}
