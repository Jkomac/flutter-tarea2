// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:comas_moreno_joseluis_pmdm_ud2/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

// Creacion de la aplicacion
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Desactivamos la banderita de debug
      initialRoute: '/', // Asignamos la barra como String identificativo para la pagina inicial
      routes: MyRoutes.getRoutes(),
      // Inicio del codigo respecto a la localizacion
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [ // Seleccion de los idiomas que deseamos
        Locale('en', ''), // Ingles, sin marcar el codigo del pais
        Locale('es', '')  // Espanyol, sin marcar el codigo del pais
      ],
      // Fin del codigo respecto a la localizacion
    );
  }
}
