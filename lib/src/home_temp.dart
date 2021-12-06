import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  HomeTemp({Key key}) : super(key: key);

  final opciones = ['1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Componentes Temps"),
      ),
      body: ListView(children: _crearlistaTemp()),
    );
  }

  //Método para poner una lista
  List<Widget> _crearlista() {
    List<Widget> lista = <Widget>[];

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista
        ..add(tempWidget)
        ..add(Divider());
    }

    return lista;
  }

  //Método usando Map
  List<Widget> _crearlistaTemp() {
    return opciones.map((item) {
      return Column(children: <Widget>[
        ListTile(
          title: Text(item + '!'),
          subtitle: Text('Cualquier cosa'),
          leading: Icon(Icons.keyboard_arrow_right_outlined),
          onTap: () {},
        ),
        Divider(),
      ]);
    }).toList();
  }
}
