import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  //Variables
  double valorSlider = 100.0;
  bool bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Divider(),
            _crearSlider(),
            Divider(),
            _crearCheckBox(),
            _crearSwitch(),
            Divider(),
            _crearImagen()
          ],
        ),
      ),
    );
  }

  //Método para retornar un slider
  Widget _crearSlider() {
    return Slider(
        value: valorSlider,
        label: "Tamaño de Imagen",
        min: 10.0,
        max: 300.0,
        divisions: 20,
        onChanged: (bloquearCheck)
            ? null
            : (valor) {
                setState(() {
                  valorSlider = valor;
                });
              });
  }

  //Método para colocar una imagen
  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          "https://m.media-amazon.com/images/I/71A+RlBsJRL._AC_SL1494_.jpg"),
      width: valorSlider,
      fit: BoxFit.contain,
    );
  }

  //Método para crear un checkbox
  Widget _crearCheckBox() {
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: bloquearCheck,
        onChanged: (onChanged) {
          setState(() {
            bloquearCheck = onChanged;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Switch'),
        value: bloquearCheck,
        onChanged: (onChanged) {
          setState(() {
            bloquearCheck = onChanged;
          });
        });
  }
}
