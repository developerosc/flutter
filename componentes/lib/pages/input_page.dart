import 'package:flutter/material.dart';

class InputPage extends StatefulWidget{
  @override
  _InputPage createState() => _InputPage();
    // TODO: implement createState



}

class _InputPage extends State<InputPage>{
  String _nombre = '';
  String _email = '';
  String _opcionSeleccionada = 'volar';

  List<String> _poderes = ['volar','rayos x','Super Aliento','no_se'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Input de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearNombre(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
        ],
      ),
    );
  }

 Widget _crearInput() {

    return TextField(
        autofocus: true,
      //  textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0)
          ),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
        ),
      onChanged: (valor){
          setState(() {
            _nombre = valor;
           // print(_nombre);
          });
      },
    );

 }

 Widget _crearNombre() {
    
    return ListTile(
      title: Text('Nombre es $_nombre'),
    );
 }

 Widget _crearEmail() {

    return TextField(
      //textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Email de la persona',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
          // print(_nombre);
        });
      },
    );
 }

  Widget _crearPassword() {

    return TextField(
      //textCapitalization: TextCapitalization.sentences,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0)
        ),
        //counter: Text('Letras ${_nombre.length}'),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor){
        setState(() {
          //_email = valor;
          // print(_nombre);
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      //textCapitalization: TextCapitalization.sentences,
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0)
        ),
        //counter: Text('Letras ${_nombre.length}'),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.account_circle),
      ),
      onTap: (){
    FocusScope.of(context).requestFocus(new FocusNode());
    _selectDate(context);
      },
    );

  }

  void _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es','ES')
    );

    if (picked != null){

      setState(() {
        _nombre = picked.toString();
        _inputFieldDateController.text = _nombre;

      });

    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){

    List<DropdownMenuItem<String>> lista = new List();

    
    _poderes.forEach((poder){
      
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
      
    });
    return lista;
}

  Widget _crearDropdown() {


    return DropdownButton(
      value: _opcionSeleccionada,
        items: getOpcionesDropdown(),
        onChanged: (opt){
        //  print(opt);
          setState(() {
            _opcionSeleccionada = opt;
          });

        });

  }
}
