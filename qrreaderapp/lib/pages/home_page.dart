import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qrreaderapp/pages/direcciones_page.dart';
import 'package:qrreaderapp/pages/mapas_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: (){

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

    String futureString = '';

    try {
      futureString = await BarcodeScanner.scan();
    }catch(error){
      futureString = error.toString();
    }
    
    print('future String $futureString');

  }
}
