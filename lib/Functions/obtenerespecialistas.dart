

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Obtenerespecialistas {
  BuildContext context;

  Obtenerespecialistas({
    required this.context
  });

  Future<dynamic> obtenerdatos() async{
    Dio dio=Dio();
    String url="http://192.168.4.100/diabeticsolutionphp/ObtenerEspecialistas.php";

    try{
    final Response= await dio.post(url);
    final json=jsonDecode(Response.data);
    return json;
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Se ha producido un error")));
    }

  }
}