// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../utils/person.dart';

class HomePage extends StatefulWidget {
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Person persona = Person.fullParametros(nombre: "", apellidos: "", email: "", password: "", fechaNacimiento: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        foregroundColor: Colors.black87,
        leading: Icon(Icons.home),
        title: Text('SPPMDM'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Welcome ${persona.nombre}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 100.0), // Espacio entre el texto y los botones
            Row( // Fila donde insertaremos los dos botones
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.large( // Primer boton
                  heroTag: null,
                  backgroundColor: Colors.greenAccent[400],
                  foregroundColor: Colors.black87,
                  onPressed: (){
                    Navigator.of(context)
                        .pushNamed('personal', arguments: persona) // Pasamos por parametro la persona a PersonalPage()
                        .then((value) {  // Esperamos posibles cambios de dicho parametro desde PersonalPage()
                          if (value != null){ // En caso de que haya modidificaciones persona coge los nuevos valores
                            setState(() {
                              persona = value as Person;
                            });
                          }
                        });
                  },
                  child: Icon(
                    Icons.person_add_alt_1_rounded
                  ),
                ),
                SizedBox(width: 50.0),
                FloatingActionButton.large( // Segundo boton
                  heroTag: null,
                  backgroundColor: Colors.greenAccent[400],
                  foregroundColor: Colors.black87,
                  onPressed: (){
                    Navigator.pushNamed(context, 'news');
                  },
                  child: Icon(
                    Icons.star
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}