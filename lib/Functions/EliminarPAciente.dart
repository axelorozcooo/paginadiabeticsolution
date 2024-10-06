
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Eliminarpaciente {
  int id;
  BuildContext context;

  Eliminarpaciente({
    required this.id,
    required this.context
  });

  void EmlinarPaciente()async{
    Dio dio=Dio();

    FormData data= FormData.fromMap({
      'id': id
    });

    String URL= "http://192.168.4.100/diabeticsolutionphp/EliminarPaciente.php";
    try{
      final Response=await dio.post(URL, data: data);
      if (Response.data=="Se ha eliminado correctamente el paciente"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Se ha eliminado corectamente el paciente")));
        
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error al eliminar")));
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Desconocido")));
      print(e.toString());
    }

  }

}