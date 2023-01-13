// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields, depend_on_referenced_packages, sort_child_properties_last, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Libreria para poder formatear las fechas
import '../utils/person.dart';

class PersonalPage extends StatefulWidget {
  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {

  // Atributos
  late String _nombre;
  late String _apellidos;
  late String _email;
  late String _password;
  late String _nacimiento;

  // Controladores
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _apellidosController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fechaController = TextEditingController();

  @override
  void didChangeDependencies() {
    final Person persona = ModalRoute.of(context)!.settings.arguments as Person;

    _nombre = persona.nombre;
    _apellidos = persona.apellidos;
    _email = persona.email;
    _password = persona.password;
    _nacimiento = persona.fechaNacimiento;

    // En caso de que la persona enviada a PersonalPage() tenga valores no "vacios"
    if (persona.nombre != '' && _nombreController.text == '') {
      _nombreController.text = persona.nombre;
    }
    if (persona.apellidos != '' && _apellidosController.text == ''){
      _apellidosController.text = persona.apellidos;
    }
    if (persona.email != '' && _emailController.text == ''){
      _emailController.text = persona.email;
    }
    if (persona.password != '' && _passwordController.text == ''){
      _passwordController.text = persona.password;
    }
    if (persona.fechaNacimiento != '' && _fechaController.text == ''){
      _fechaController.text = persona.fechaNacimiento;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          foregroundColor: Colors.black87,
          leading: Icon(Icons.person_sharp),
          title: Text('Comas'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset:
            false, // Instruccion para que el boton Guardar no se desplace arriba al abrir el teclado
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0), // Separacion entre el contenido y los marcos
          children: [
            _crearNombre(),
            Divider(),
            _crearApellidos(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearFecha(context),
            Divider(),
          ],
        ),
        floatingActionButton: _btnGuardar());
  }

  // Metodo para cambiar el aspecto de la casilla al estar seleccionado
  _focusColorBorder() {
    return OutlineInputBorder(
        // Tipo visual de casilla al estar
        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
        borderRadius: BorderRadius.circular(30.0));
  }

  // Metodo para crear el campo del nombre
  Widget _crearNombre() {
    return TextField(
      textCapitalization: TextCapitalization.words, // Para que los nombres compuestos puedan empezar en mayusculas
      controller: _nombreController,
      decoration: InputDecoration(
        labelText: 'Nombre',
        hintText: 'Escribe tu nombre',
        icon: Icon(Icons.person), // Icono a la izquierda de la etiqueta
        suffixIcon: Icon(Icons
            .accessibility_new_rounded), // Icono dentro de la etiqueta situado a la derecha
        border: OutlineInputBorder(
            // Tipo visual de casilla
            borderRadius: BorderRadius.circular(30.0) // Esquinas circulares
            ),
        focusedBorder: _focusColorBorder(),
      ),
      onChanged: (value) {
        // Metodo que evalua los cambios en el campo de texto
        setState(() {
          // Asignamos el valor escrito en la casilla a la variable _nombre
          _nombre = value;
        });
      },
    );
  }

  // Metodo para crear el campo de apellidos
  Widget _crearApellidos() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      controller: _apellidosController,
      decoration: InputDecoration(
        labelText: 'Apellidos',
        hintText: 'Escribe tus apellidos',
        icon: Icon(Icons.person),
        suffixIcon: Icon(Icons.accessibility_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: _focusColorBorder(),
      ),
      onChanged: (value) {
        // Asignamos el valor escrito en la casilla a la variable _apellidos
        setState(() {
          _apellidos = value;
        });
      },
    );
  }

  // Metodo para crear el campo del email
  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType
          .emailAddress, // Facilita la escritura del email anyadiendo una '@' y '.' en el teclado
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Escribe tu email',
        icon: Icon(Icons.email_rounded),
        suffixIcon: Icon(Icons.alternate_email_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: _focusColorBorder(),
      ),
      onChanged: (value) {
        // Asignamos el valor escrito en la casilla a la variable _email
        _email = value;
      },
    );
  }

  // Metodo para crear el campo de la constrasenya
  Widget _crearPassword() {
    return TextField(
      obscureText: true, // Oculta los caracteres tras '·' al escribir
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        hintText: 'Escribe una contraseña',
        helperText: 'Mínimo 6 caracteres',
        counter: Text('Caracteres ${_password.length}'),
        icon: Icon(Icons.lock_rounded),
        suffixIcon: Icon(Icons.password_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: _focusColorBorder(),
      ),
      onChanged: (value) {
        // Asignamos el valor escrito en la casilla a la variable _password
        setState(() {
          _password = value;
        });
      },
    );
  }

  // Metodo para crear el campo de la fecha de nacimiento
  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false, // Desactivamos el puntero de seleccion
      controller: _fechaController, // Controllar la escritura de dicha casilla
      decoration: InputDecoration(
        labelText: 'Fecha de nacimiento',
        icon: Icon(Icons.calendar_today_rounded),
        suffixIcon: Icon(Icons.perm_contact_calendar_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onTap: () {
        // Metodo que se efectuara al pulsar sobre dicha casilla
        FocusScope.of(context).requestFocus(FocusNode());
        _seleccionarFecha(context);
      },
    );
  }

  // Metodo para seleccionar la fecha en el calendario creado (dialogo)
  void _seleccionarFecha(BuildContext context) async {
    // Formato de la fecha indicada
    DateFormat f = DateFormat('dd-MM-yyyy');
    // Creacion del dialogo calendario y seleccion de la fecha por el usuario
    DateTime? seleccionado = await showDatePicker(
        locale: Locale('es', 'ES'), // Idioma del calendario
        context: context,
        initialDate: DateTime
            .now(), // Fecha inicial seleccionada al mostrar el calendario
        firstDate:
            DateTime(1923), // Margen inicial del calendario (100 anyos vista)
        lastDate: DateTime
            .now() // Margen final del calendario (Ya que nadie puede nacer "manyana")
        );

    if (seleccionado != null) {
      // En caso de que alguna fecha sea seleccionada
      setState(() {
        _nacimiento = f
            .format(seleccionado)
            .toString(); // Asignamos y formateamos la fecha seleccionada a la variable _nacimiento
        _fechaController.text =
            _nacimiento; // Hacemos que la fecha aparezca en la casilla al ser seleccionada
      });
    }
  }

  // Metodo para crear el boton de Guardar
  Widget _btnGuardar() {
    return ElevatedButton(
      child: Text('Guardar'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent[400],
        foregroundColor: Colors.black87,
        shape: StadiumBorder(),
      ),
      onPressed: () {
        final Person persona = Person.fullParametros(
            nombre: _nombreController.text,
            apellidos: _apellidosController.text,
            email: _emailController.text,
            password: _passwordController.text,
            fechaNacimiento: _fechaController.text);
        Navigator.of(context).pop(persona); // Volver a la pagina anterior
      },
    );
  }
}
