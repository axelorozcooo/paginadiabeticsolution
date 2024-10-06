import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Actualizarespecialista {
  int id;
  String nombre, apellido_m, apellido_p, especialidad, cedprof;
  BuildContext context;
  int premium;

  Actualizarespecialista({required this.id, required this.context, required this.nombre, required this.apellido_p, required this.apellido_m, required this.cedprof, required this.especialidad, required this.premium});

  void actualizarEspecialista() async {
    Dio dio = Dio();

    FormData data = FormData.fromMap({
      'id': id,
      'nombre':nombre,
      'apellido_p': apellido_p,
      'apellido_m': apellido_m, 
      'especialidad': especialidad,
      'cedProf': cedprof,
      'premium': premium
      });

    String url =
        "http://192.168.4.100/diabeticsolutionphp/ActualizarEspecialista.php";
    try {
      final Response = await dio.post(url, data: data);
      if (Response.data == "Se ha Actualizado el Especialista con exito") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Se ha Actualizado el Especilista con exito")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Se ha producido un error")));
    }
  }
}
