// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:badges/badges.dart'; // Libreria anyadida en dependencies para usar Badges
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart'; // Libreria anyadida en dependencies para usar PieChart

class WidgetPage extends StatefulWidget {

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {

  // Atributos
  Map<String, double> _tiempoDisponible = _rellenarDia();
  int _notificaciones = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        foregroundColor: Colors.black87,
        leading: Icon(Icons.stars_rounded),
        centerTitle: true,
        title: Text(
          'NOVEDADES',
           style: TextStyle(
            fontWeight: FontWeight.w800,
           ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 150.0), // Separacion del Container con el marco superior del Body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('DISTRIBUCIÓN DEL TIEMPO DIARIO:', style: _estiloLetra(),),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: _crearPieChart()
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('NOTIFICACIONES DEL EMAIL:', style: _estiloLetra()),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: _crearBadge()
                  ),
                  SizedBox(width: 110),
                  _btnEmail()
                ],
              ),
            ),
          ],
        ),
        ),
      floatingActionButton: _btnBack()
    );
  }

  // Rellenar el Map del PieChart
  static Map<String, double> _rellenarDia(){
    return <String, double>{
      'Estudiar'    : 9.0,
      'Dormir'      : 8.0,
      'Videojuegos' : 2.75,
      'Comer'       : 2.0,
      'Deporte'     : 1.5,
      'Asearse'     : 0.75
    };
  }

  // Metodo para establecer un tipo de letra predeterminado
   _estiloLetra(){
    return TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 22.0,
      decoration: TextDecoration.underline
    );
  }

  // Metodo para crear un PieChart
  Widget _crearPieChart(){
    return PieChart(
      dataMap: _tiempoDisponible,
      animationDuration: Duration(milliseconds: 1500), // Tiempo de animacion a la hora de crearlo
      chartLegendSpacing: 48, // Separacion entre el PieChart y los circulos de los Legends
      initialAngleInDegree: 0, // Dibuja el PieChart del angulo 0 en sentido de las agujas del reloj
      chartType: ChartType.disc, // Estilo de tipo de PieChart
      legendOptions: LegendOptions( 
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.w800 // Letra negrita en los Legends
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValues: true, // Mostrar valores de los quesitos
        showChartValueBackground: true, // Habilitar fondo de los valores
        showChartValuesInPercentage: true, // Mostrar los valores en porcentajes
        showChartValuesOutside: false // Mostrar los valores dentro de los quesitos
      ),
    );
  }

  // Metodo para la creacion del Badge
  Widget _crearBadge(){
    return Badge(
      showBadge: (_notificaciones > 0) ? true : false, // Si no hay notificaciones, no se muestra
      badgeContent: Text('$_notificaciones', style: TextStyle(color: Colors.white)),
      animationType: BadgeAnimationType.scale, // Tipo de animacion cuando varia el Badge
      animationDuration: Duration(milliseconds: 250),
      child: Icon(
        Icons.email_outlined,
        size: 75.0,
        color: Colors.white,
      ),
    );
  }

  // Metodo para creacion del boton Enviar email
  Widget _btnEmail() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
      ),
      child: Text('Enviar email', style: TextStyle(fontWeight: FontWeight.bold)),
      onPressed: () {
        setState(() {
          _notificaciones++;
        });
      }
    );
  }

  // Metodo para la creacion del boton back
  Widget _btnBack(){
    return FloatingActionButton(
      backgroundColor: Colors.greenAccent[400],
      foregroundColor: Colors.black87,
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back)
    );
  }
}