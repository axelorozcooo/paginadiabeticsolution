import 'package:flutter/material.dart';
import 'package:paginadiabeticsolution/Activities/Activitylogin.dart';
import 'package:paginadiabeticsolution/theme/app_theme.dart';

void main() {
  runApp(const DiabeticSolutionApp());
}

class DiabeticSolutionApp extends StatelessWidget {
  const DiabeticSolutionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PaginaMain(),
    );
  }
}

class PaginaMain extends StatelessWidget {
  const PaginaMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diabetic Solution"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Activitylogin()),
              );
            },
            child: const Text(
              "Iniciar sesión",
              style: TextStyle(
                color: Color.fromARGB(255, 21, 193, 190),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: fondoGradiente,
        height: double.infinity,
        width: double.infinity,
        alignment: AlignmentDirectional.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25,),
              Image.asset('dsicon_mix.png', scale: 8),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "En Diabetic Solution, nos dedicamos a transformar la forma en que las personas con diabetes gestionan su salud. Nuestra aplicación móvil innovadora está diseñada para ayudar a los pacientes con diabetes tipo 1 y tipo 2 a controlar sus niveles de glucosa y a llevar una alimentación equilibrada, mejorando así su calidad de vida.",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      "¿Qué Ofrecemos?", 
                      style: TextStyle(color: Color.fromARGB(255, 21, 193, 190), fontWeight: FontWeight.w800, fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Center(
                child: Container(
                  decoration: const BoxDecoration(color: Color.fromARGB(148, 102, 102, 102)),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Nuestra aplicación utiliza inteligencia artificial para crear dietas personalizadas basadas en las necesidades nutricionales específicas de cada usuario. A través de una interfaz intuitiva y fácil de usar, los pacientes pueden registrar sus porciones diarias de alimentos y acceder a información nutricional detallada. Esto les permite conocer la cantidad exacta de macronutrientes que consumen, facilitando un control más efectivo de su salud.\n\nAdemás, Diabetic Solution promueve la educación y el autocuidado, ofreciendo consejos prácticos y recomendaciones personalizadas de especialistas de la salud. A través de nuestro sistema, los usuarios pueden monitorear sus niveles de glucosa, gestionar sus medicamentos y recibir alertas sobre sus ingestas alimentarias.",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
