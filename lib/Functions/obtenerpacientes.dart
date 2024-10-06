

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Obtenerpacientes {
  BuildContext context;
  
  Obtenerpacientes({
    required this.context
  });

  Future<dynamic> recibirDatos() async{
    Dio dio =Dio();
    String url= "http://192.168.4.100/diabeticsolutionphp/ObtenerPacientes.php";

    try{

    final Response=await dio.post(url);
    final json=jsonDecode(Response.data);
    return json;
    
  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error")));
    print(e.toString());
  }
}
}