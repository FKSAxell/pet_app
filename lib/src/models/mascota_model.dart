import 'package:pet_app/src/models/vacuna_model.dart';

class Mascota {
  String id;
  String nombre;
  DateTime fechaNacimiento;
  String sexo;
  String peso;
  List<Vacuna>? vacuna;

  Mascota({
    required this.id,
    required this.nombre,
    required this.fechaNacimiento,
    required this.sexo,
    required this.peso,
    this.vacuna,
  });
}
