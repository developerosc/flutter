
import 'package:flutter/material.dart';
import 'package:qrreaderapp/Utils/utils.dart' as utils;
import 'package:qrreaderapp/bloc/scan_bloc.dart';
import 'package:qrreaderapp/models/scan_model.dart';

class MapasPage extends StatelessWidget {

  final scanBloc = new ScansBloc();
  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder<List<ScanModel>>(
      stream:  scanBloc.scanStream,
        builder: (BuildContext context,AsyncSnapshot<List<ScanModel>> snapshot){

        if(!snapshot.hasData){

          return Center(child: CircularProgressIndicator());
        }

        final scans = snapshot.data;

        return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, i) =>
            Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direction) => scanBloc.borrarScan(scans[i].id),
            child:
             ListTile(
              leading: Icon(Icons.add),
             title: Text(scans[i].valor),
             subtitle: Text('${scans[i].id}'),
             trailing: Icon(Icons.add),
               onTap: () => utils.abrirScan(context,scans[i]),
        ),
            )




        );
        }
    );
}
}
