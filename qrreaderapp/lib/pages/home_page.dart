import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qrreaderapp/Utils/utils.dart' as utils ;
import 'package:qrreaderapp/bloc/scan_bloc.dart';
import 'package:qrreaderapp/models/scan_model.dart';
import 'package:qrreaderapp/pages/direcciones_page.dart';
import 'package:qrreaderapp/pages/mapas_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final scanBloc = new ScansBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: (){
                scanBloc.borrarScanTODOS;
          })
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearbottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
          onPressed: _scanQR),

    );
  }

  Widget _crearbottomNavigationBar(){

    return BottomNavigationBar(
      currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.map),
            title: Text('Mapas')
    )  ,
          BottomNavigationBarItem(
          icon: Icon(Icons.map),
            title: Text('Direcciones')
    )
        ],
    onTap: (index) {
        setState(() {
          currentIndex = index;
        });
    },
    );

  }

 Widget _callPage(int paginaActual) {

    switch(paginaActual){
      case 0: return MapasPage();
      case 1: return DireccionesPage();
    }

  }

  void _scanQR() async {

    //https://www.google.com/

    //geo:40.714865545932355,-73.92354383906253

    String futureString = 'https://www.google.com';

//
//    try {
//      futureString = await BarcodeScanner.scan();
//    }catch(error){
//      futureString = error.toString();
//    }
//
//    print('future String $futureString');

  if(futureString != null){

    final scan = ScanModel(valor: futureString);
    scanBloc.agregarScan(scan);
    //utils.abrirScan(scan);
  }

  }
}
