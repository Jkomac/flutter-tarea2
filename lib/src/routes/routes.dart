import 'package:comas_moreno_joseluis_pmdm_ud2/src/pages/home_page.dart';
import 'package:comas_moreno_joseluis_pmdm_ud2/src/pages/personal_page.dart';
import 'package:comas_moreno_joseluis_pmdm_ud2/src/pages/widget_page.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  // Metodo para devolver las rutas a partir de un String asignado
  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      '/': (BuildContext context) => HomePage(),
      'personal': (BuildContext context) => PersonalPage(),
      'news': (BuildContext context) => WidgetPage()
    };
  }
}
