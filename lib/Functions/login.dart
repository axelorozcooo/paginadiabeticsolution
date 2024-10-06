

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paginadiabeticsolution/Activities/ActivityAdministradorPacientes.dart';

class login{
  String correo, contrasena;
  BuildContext context;

  login({ required this.contrasena, required this.correo, required this.context});

  void inSesion()async{
    Dio dio=Dio();

    Map<String, dynamic> data = {'correo': correo, 'contraseña': contrasena};
    String URL="http://192.168.4.100/diabeticsolutionphp/AutenticarAdministrador.php";
    
    try{
      final response = await dio.put(URL, data: data);
      final json= jsonDecode(response.data);
      final idAdministrador= json['idAdministrador'];
      final nombre=json['nombre'];


      if (idAdministrador =="null" && nombre=="null"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verifique sus Datos!!...")));
      }else if (idAdministrador !="null" && nombre=="null"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("contraseña incorrecta")));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('bienvenido $nombre')));
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Activityadministrador()) );
      }


    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error")));
      print(e.toString());
    }

  }
  
}