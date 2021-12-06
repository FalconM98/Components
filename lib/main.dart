import 'package:components/src/card_page.dart';
import 'package:components/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //Localizations
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('es', 'ES'), // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //Se llama al objeto route para lograr interactuar entre las páginas
      routes: route,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => CardPage());
      },
    );
  }
}
