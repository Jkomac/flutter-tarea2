// ignore_for_file: unused_field, unnecessary_getters_setters

class Person{

  // Atributos
  late String nombre;
  late String apellidos;
  late String email;
  late String password;
  late String fechaNacimiento;

  Person.fullParametros({
    required this.nombre,
    required this.apellidos,
    required this.email,
    required this.password,
    required this.fechaNacimiento
  });
}