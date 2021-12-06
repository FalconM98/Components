import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, shape: StadiumBorder()),
          onPressed: () => _MostrarMensaje(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alarm),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  //Función para mandar mensaje de Alerta
  void _MostrarMensaje(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Título'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Esta es una columna de un mensaje de alerta'),
                FlutterLogo(
                  size: 100.0,
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
  }
}
