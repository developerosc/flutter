


import 'dart:async';

import 'package:qrreaderapp/providers/db_provider.dart';

class ScansBloc {


  static final ScansBloc _singleton = new ScansBloc._internal();


  factory ScansBloc(){

    return _singleton;
  }


  ScansBloc._internal(){
    obtenerScans();
  }

  final _scanController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scanStream => _scanController.stream;

  dispose(){
    _scanController?.close();
  }

  obtenerScans() async {

    _scanController.sink.add(await DBProvider.db.getTodosScans());
  }

  agregarScan(ScanModel scan) async{
   await DBProvider.db.nuevoScan(scan);
   obtenerScans();
  }

  borrarScan(int id)async{

   await DBProvider.db.deleteScan(id);
    obtenerScans();

  }

  borrarScanTODOS()async{

    await DBProvider.db.deleteAll();
    obtenerScans();
  }


}