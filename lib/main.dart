import 'package:componentes/src/pages/alert_pages.dart';
import 'package:componentes/src/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:[
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale ('en', 'US'), // English
        const Locale ('he', 'IL'), // Hebrew
        const Locale ('es', 'ES'), // Hebrew
      ],
      debugShowCheckedModeBanner: false,
      title: 'COMPONENETES',
      // home: HomePages(),
      initialRoute: '/',
      routes: getRoutes(),
      onGenerateRoute: ( RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPages(),
        );
      }
    );
  }
}