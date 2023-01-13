// ignore_for_file: unused_field, unnecessary_getters_setters

class Person{

  // Atributos
  late String _nombre;
  late String _apellidos;
  late String _email;
  late String _password;
  late String _fechaNacimiento;

  // Constructor
  Person(){
    _nombre = "";
    _apellidos = "";
    _email = "";
    _password = "";
    _fechaNacimiento = "";
  }

  Person.fullParametros(String nombre, String apellidos, String email, String password, String nacimiento){
    _nombre = nombre;
    _apellidos = apellidos;
    _email = email;
    _password = password;
    _fechaNacimiento = nacimiento;
  }

  // Getters y Setters
  String get nombre {
    return _nombre;
  }
  set nombre(String nombre){
    _nombre = nombre;
  }
  
  String get apellidos{
    return _apellidos;
  }
  set apellidos(String apellidos){
    _apellidos = apellidos;
  }

  String get email{
    return _email;
  }
  set email(String email){
    _email = email;
  }

  String get password{
    return _password;
  }
  set password(String password){
    _password = password;
  }

  String get fechaNacimiento{
    return _fechaNacimiento;
  }
  set fechaNacimiento(String fecha){
    _fechaNacimiento = fecha;
  }
}