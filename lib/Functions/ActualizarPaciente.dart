
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Actualizarpaciente {
  String nombre, apellido_p, apellido_m;
  int edad, id, premium;
  BuildContext context;

  Actualizarpaciente({
    required this.id,
    required this.apellido_m,
    required this.apellido_p,
    required this.edad,
    required this.nombre,
    required this.premium,
    required this.context
  });

  void ActualizarDatos() async{
    Dio dio=Dio();

    FormData data = FormData.fromMap({
      'id': id,
      'nombre': nombre,
      'apellido_p': apellido_p,
      'apellido_m': apellido_m,
      'edad':edad,
      'premium': premium
    });

    String URL="192.168.4.100/diabeticsolutionphp/ActualizarPaciente.php";

    try{
    final Response=await dio.post(URL);
    if (Response.data=="la actualizacion fue exitosa"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Actualizacion Exitosa")));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error al Actualizar los Datos")));
    }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error")));
    }
  }
}