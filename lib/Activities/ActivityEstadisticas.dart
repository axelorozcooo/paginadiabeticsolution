import 'package:flutter/material.dart';
import 'package:paginadiabeticsolution/Activities/ActivityAdministradorEspecialistas.dart';
import 'package:paginadiabeticsolution/Activities/ActivityAdministradorPacientes.dart';
import 'package:paginadiabeticsolution/theme/app_theme.dart';

/*void main() {
  runApp(runestadisticas());
}

class runestadisticas extends StatelessWidget {
  const runestadisticas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Activityestadisticas(),
    );
  }
}*/

class Activityestadisticas extends StatelessWidget {
  const Activityestadisticas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Activityadministrador()));
              },
              child: const Text(
                "Pacientes",
                style: TextStyle(
                  color: Color.fromARGB(255, 21, 193, 190),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ActivityadministradorEsp()));
              },
              child: const Text(
                "Especialistas",
                style: TextStyle(
                  color: Color.fromARGB(255, 21, 193, 190),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Activityestadisticas()));
              },
              child: const Text(
                "Estadisticas",
                style: TextStyle(
                  color: Color.fromARGB(255, 21, 193, 190),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: fondoGradiente,
            child: Column(children: [
              const SizedBox(height: 20),
              const Row(
                children: [
                  SizedBox(height: 20, width: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "ESTADISTICAS",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 170,
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Pacientes",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 193, 190),
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "8",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 193, 190),
                              fontWeight: FontWeight.w800,
                              fontSize: 38,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Especialistas",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 193, 190),
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "15",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 193, 190),
                              fontWeight: FontWeight.w800,
                              fontSize: 38,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Usuarios",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 193, 190),
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "22",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 193, 190),
                              fontWeight: FontWeight.w800,
                              fontSize: 38,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 350,
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Pacientes Premium",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 193, 190),
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "2",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 193, 190),
                              fontWeight: FontWeight.w800,
                              fontSize: 38,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 185,
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Espacialistas Premium",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 193, 190),
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "3",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 193, 190),
                              fontWeight: FontWeight.w800,
                              fontSize: 38,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ])));
  }
}
