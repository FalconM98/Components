import 'package:components/src/alert.pages.dart';
import 'package:components/src/avatar_page.dart';
import 'package:components/src/home_page.dart';
import 'package:components/src/inputs_page.dart';
import 'package:components/src/listview_page.dart';
import 'package:components/src/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:components/src/animated_container.dart';

Map<String, Widget Function(BuildContext)> route = <String, WidgetBuilder>{
  '/': (BuildContext context) => HomePage(),
  'alert': (BuildContext context) => AlertPage(),
  'avatar': (BuildContext context) => AvatarPage(),
  'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
  'inputs': (BuildContext context) => InputsPage(),
  'slider': (BuildContext context) => SliderPage(),
  "listview": (BuildContext context) => ListViewPage()
};
