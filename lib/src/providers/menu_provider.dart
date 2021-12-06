import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  //Se cargan los datos
  _MenuProvider() {
    cargarData();
  }

  //Método para lograr cargar el json local
  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

//Se crea la instancia
final menuProvider = new _MenuProvider();
