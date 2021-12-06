import 'package:flutter/material.dart';

//Se mapea los Iconos
final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'slideshow_rounded': Icons.slideshow_rounded,
  "list_rounded": Icons.list_rounded
};

//Se crea el método para buscar el objeto y lograr mapearlo
// Y de de esta manera retonarlo
Icon getIcon(String icono) {
  return Icon(_icons[icono], color: Colors.blueAccent);
}
