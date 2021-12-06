import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: [
          _cardTipo1(),
          SizedBox(width: 30.0, height: 30.0),
          _cardTipo2(),
          SizedBox(width: 30.0, height: 30.0),
          _cardTipo1(),
          SizedBox(width: 30.0, height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  //Método para mostrar la primera tarjeta con sus propiedades
  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.access_time_sharp, color: Colors.blueGrey),
          title: Text('Soy un texto'),
          subtitle: Text('Soy un subtitulo'),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            child: Text('Cancelar'),
            onPressed: () {},
          ),
          // ignore: deprecated_member_use
          FlatButton(
            child: Text('Ok'),
            onPressed: () {},
          ),
        ]),
      ]),
    );
  }

  //Método para mostrar la carta que va a tener la imagen
  Widget _cardTipo2() {
    final card = Container(
      child: Column(children: <Widget>[
        FadeInImage(
          image: NetworkImage(
              'https://www.muylinux.com/wp-content/uploads/2018/08/Dart.png'),
          placeholder: AssetImage('img/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 600),
          height: 200,
          fit: BoxFit.cover,
        ),
        Container(padding: EdgeInsets.all(10.0), child: Text('Imagen de Dart')),
      ]),
    );

    //Retorna las propiedades del Contenedor
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
