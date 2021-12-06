import 'package:flutter/material.dart';
import 'dart:async';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  //Variables
  final List<int> _listaNumeros = [];
  int _ultimoitem = 0;
  final ScrollController _scroll = ScrollController();
  bool isLoading = false;

  //Método que se ejecutara cuando se carge el Scaffold
  @override
  void initState() {
    super.initState();
    _Agregar3();
    _scroll.addListener(() {
      if (_scroll.position.pixels == _scroll.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  //Método para liberar memoria
  @override
  void dispose() {
    _scroll.dispose();
  }

  //Principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  //Método para crear una lista
  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scroll,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int n) {
          return FadeInImage(
            image: NetworkImage(
                'https://i.picsum.photos/id/1020/4288/2848.jpg?hmac=Jo3ofatg0fee3HGOliAIIkcg4KGXC8UOTO1dm5qIIPc'),
            placeholder: AssetImage('img/jar-loading.gif'),
          );
        },
      ),
    );
  }

  //Método para obtener páginas usando OnRefresh
  Future<Null> obtenerPagina1() async {
    //Variables
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _listaNumeros.clear();
      _ultimoitem++;
      _Agregar3();
    });

    return Future.delayed(duration);
  }

  //Función para agregar 10 valores
  // ignore: non_constant_identifier_names
  void _Agregar3() {
    for (var i = 0; i < 3; i++) {
      _ultimoitem++;
      _listaNumeros.add(_ultimoitem);
    }
    setState(() {});
  }

  Future fetchData() async {
    //Se indica que esta cargando
    isLoading = true;
    setState(() {});
    //Se indica la duración que va a tener para cargar
    final duration = Duration(seconds: 2);
    //Se retorna la propiedad timer para indicar cuando va a tardar en cargar
    //los elementos
    return Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    isLoading = false;
    //Animación para el Scroll
    _scroll.animateTo(_scroll.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(microseconds: 250));
    _Agregar3();
  }

  //Método para crear un circulo de cargar
  Widget _crearLoading() {
    //Si no esta cargando
    if (isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
