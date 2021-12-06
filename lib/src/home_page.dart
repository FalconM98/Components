import 'package:components/src/utils/util_string_icon.dart';
import 'package:flutter/material.dart';
import 'providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu Princiapl'),
          centerTitle: true,
        ),
        body: _lista());
  }

  //Este método retorna la lista
  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  //Este método crea la lista mediante un Future builder
  //Usando la instancia ya creada en el menu provider
  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> children = [];
    //Se visualizan los datos en la lista
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.wb_twilight, color: Colors.brown),
        onTap: () {
          Navigator.pushNamed(context, '${opt['ruta']}');
        },
      );
      children
        ..add(widgetTemp)
        ..add(Divider());
    });
    return children;
  }
}
