import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  //Variables
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionar = 'Volar';
  final List _poderes = ['Volar', 'SuperFueza', 'SuperVelocidad', 'SuperRayos'];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InputPage"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        //Aquí se estan agregando los metodos para usar los textfield,
        //con diferente características
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPass(),
          Divider(),
          _crearFecha(),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  //Método para escribir el nombre
  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la Persona',
          labelText: 'Nombre',
          helperText: 'Escriba solo el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_balance)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  //Método reflejar lo que se escribio
  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre: $_nombre"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_opcionSeleccionar),
    );
  }

  //Método para escribir su email
  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Escriba su email',
          suffixIcon: Icon(Icons.alternate_email_outlined),
          icon: Icon(Icons.email)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  //Método para escribir su password
  Widget _crearPass() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          helperText: 'Escriba su password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.password)),
    );
  }

  //Método para crear una fecha
  Widget _crearFecha() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _textEditingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha de Nacimieto',
          helperText: 'Escriba una fecha',
          suffixIcon: Icon(Icons.calendar_view_day),
          icon: Icon(Icons.calendar_view_week)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  //Método para crear un dropDown
  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.adb),
        Expanded(
          child: DropdownButton<String>(
            value: _opcionSeleccionar,
            items: getOpcionesDropDawn(),
            onChanged: (x) {
              setState(() {
                _opcionSeleccionar = x;
              });
            },
          ),
        )
      ],
    );
  }

  //Se crea la lista de elementos de del dropDownButton
  List<DropdownMenuItem<String>> getOpcionesDropDawn() {
    //Se crea una nueva lista de tipo String
    List<DropdownMenuItem<String>> lista = [];
    //Se recorre la lista y se agrega los String de la otra
    //lista para visualizar
    for (var poder in _poderes) {
      lista.add(DropdownMenuItem(
        child: Text(poder, textAlign: TextAlign.center),
        value: poder,
      ));
    }

    return lista;
  }

  //Función para cargar el calendario y imprimir la fecha en el
  _selectDate(BuildContext context) async {
    DateTime dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));

    if (dateTime != null) {
      setState(() {
        _fecha = dateTime.toString();
        _textEditingController.text = _fecha;
      });
    }
  }
}
