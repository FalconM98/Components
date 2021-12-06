import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _height = 50.0;
  double _width = 50.0;
  Color _color = Colors.redAccent;
  BorderRadiusGeometry _border = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          height: _height,
          width: _width,
          decoration: BoxDecoration(color: _color, borderRadius: _border),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cambiarforma();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void cambiarforma() {
    //Se obtiene un valor ramdom
    final random = Random();
    //Se colocan los valores
    setState(() {
      //Valores random para width
      _width = random.nextInt(300).toDouble();
      //Valores random para heigth
      _height = random.nextInt(300).toDouble();
      //Valores random para los colores
      _color = Color.fromRGBO(
          random.nextInt(300), random.nextInt(300), random.nextInt(300), 1);
      //Valores random para los Bordes circulares
      _border = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
