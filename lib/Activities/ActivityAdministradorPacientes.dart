import 'package:flutter/material.dart';
import 'package:paginadiabeticsolution/Activities/ActivityAdministradorEspecialistas.dart';
import 'package:paginadiabeticsolution/Activities/ActivityEstadisticas.dart';
import 'package:paginadiabeticsolution/Functions/ActualizarPaciente.dart';
import 'package:paginadiabeticsolution/Functions/EliminarPAciente.dart';
import 'package:paginadiabeticsolution/Functions/obtenerpacientes.dart';
import 'package:paginadiabeticsolution/theme/app_theme.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Activityadministrador(),
    );
  }
}
*/
class Activityadministrador extends StatefulWidget {
  Activityadministrador({super.key});

  @override
  State<Activityadministrador> createState() => _ActivityadministradorState();
}


class _ActivityadministradorState extends State<Activityadministrador> {
  List<PacientItem> _pacientList = [];
  dynamic json;

  @override
  void initState() {
    super.initState();
    procesarDatos(context); // Llama a procesarDatos solo una vez en initState
  }

  void procesarDatos(BuildContext context) async {
    Obtenerpacientes op = Obtenerpacientes(context: context);
    json = await op.recibirDatos();

    if (json != null) {
      for (int i = 0; i < json.length; i++) {
        int id =json[i]['id'] ?? 0;
        String nombre = json[i]['nombre'] ?? "";
        String apellido_p = json[i]['apellido_p'] ?? "";
        String apellido_m = json[i]['apellido_m'] ?? "";
        int edad = json[i]['edad'] ?? 0;
        String especialista = json[i]['especialista'] ?? "";
        String premium = (json[i]['premium'] == 0) ? "no" : "si";

           PacientItem pi=PacientItem(id: id ,nombre: nombre, apellido_m: apellido_m, apellido_p: apellido_p, edad: edad, especialista: especialista, premium: premium, );
        setState(() {
           _pacientList.add(pi);
        });
    }
    }
  
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Activityadministrador()));
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
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ActivityadministradorEsp()));
            }, child: const Text(
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Activityestadisticas()));
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
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Row(
                children: [
                  SizedBox(height: 20, width: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "PACIENTES",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              // Aquí es donde se aplica Expanded
              Expanded(
                child: Container(
                  width: 1050,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: _buildTable(context),
                ),
              ),
            ],
          ),
        ),
      );
    
  }
  

  Widget _buildTable(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double headerFontSize = screenWidth * 0.015;
    double cellFontSize = screenWidth * 0.013;

    TextStyle headerStyle = TextStyle(
        fontFamily: 'lspartanr',
        fontSize: headerFontSize,
        fontWeight: FontWeight.w600,
        color: Colors.white);
    TextStyle cellStyle = TextStyle(
        fontFamily: 'lspartanr', fontSize: cellFontSize, color: Colors.black);
    Color headerColor = verdeAwa;
    Color evenRowColor = Colors.tealAccent.withOpacity(0.3);
    Color oddRowColor = Colors.white;

    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: DataTable(
              headingRowColor: WidgetStatePropertyAll(headerColor),
              columnSpacing: 10.0,
              columns: <DataColumn>[
                DataColumn(
                  label: Center(
                    child: Text('Nombre', style: headerStyle),
                  ),
                  tooltip: "Nombre",
                ),
                DataColumn(
                  label: Center(
                    child: Text('Apellido Materno', style: headerStyle),
                  ),
                  tooltip: 'Apellido Materno',
                ),
                DataColumn(
                  label: Center(
                    child: Text('Apellido Paterno', style: headerStyle),
                  ),
                  tooltip: 'Apellido Paterno',
                ),
                DataColumn(
                  label: Center(
                    child: Text('Edad', style: headerStyle),
                  ),
                  tooltip: 'Edad',
                ),
                DataColumn(
                  label: Center(
                    child: Text('Especialista', style: headerStyle),
                  ),
                  tooltip: 'Especialista',
                ),
                DataColumn(
                  label: Center(
                    child: Text('Premium', style: headerStyle),
                  ),
                ),
                DataColumn(
                  label: Center(
                    child: Text('Editar', style: headerStyle),
                  ),
                  
                ),
                DataColumn(label: Center(child: Text("Eliminar", style: headerStyle,),))
              ],
              rows: _pacientList.asMap().entries.map<DataRow>((entry) {
                int index = entry.key;
                PacientItem pacientItem = entry.value;
                Color rowColor = index.isEven ? evenRowColor : oddRowColor;
                return DataRow(
                  color: WidgetStatePropertyAll(rowColor),
                  cells: <DataCell>[
                    DataCell(Center(
                        child: Text(pacientItem.nombre, style: cellStyle))),
                    DataCell(Center(
                        child: Text(pacientItem.apellido_m.toString(),
                            style: cellStyle))),
                    DataCell(Center(
                        child: Text(pacientItem.apellido_p.toString(),
                            style: cellStyle))),
                    DataCell(Center(
                        child: Text(pacientItem.edad.toString(),
                            style: cellStyle))),
                    DataCell(Center(
                        child: Text(pacientItem.especialista.toString(),
                            style: cellStyle))),
                    DataCell(Center(
                        child: Text(pacientItem.premium.toString(),
                            style: cellStyle))),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          _editPaciente(index); // Llama la función de edición
                        },
                      ),
                    ),
                    DataCell(IconButton(icon: const Icon(Icons.delete, color: Colors.blue,),
                    onPressed: (){
                      _confirmarEliminacion(context, index);
                    },
                      )
                    )
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
   void _confirmarEliminacion(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: const Text('¿Realmente lo quieres eliminar?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  Eliminarpaciente ep=Eliminarpaciente(id: _pacientList[index].id, context: context);
                  ep.EmlinarPaciente();
                  _pacientList.removeAt(index); // Elimina el paciente
                });
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Sí'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo sin hacer nada
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _editPaciente(int index) {
    TextEditingController nombreController =
        TextEditingController(text: _pacientList[index].nombre);
    TextEditingController apellidoMController =
        TextEditingController(text: _pacientList[index].apellido_m);
    TextEditingController apellidoPController =
        TextEditingController(text: _pacientList[index].apellido_p);
    TextEditingController edadController =
        TextEditingController(text: _pacientList[index].edad.toString());
    TextEditingController especialistaController =
        TextEditingController(text: _pacientList[index].especialista);
    TextEditingController premiumController =
        TextEditingController(text: _pacientList[index].premium);
        TextEditingController idController= TextEditingController(text: _pacientList[index].id.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Paciente'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: apellidoMController,
                  decoration: const InputDecoration(labelText: 'Apellido Materno'),
                ),
                TextField(
                  controller: apellidoPController,
                  decoration: const InputDecoration(labelText: 'Apellido Paterno'),
                ),
                TextField(
                  controller: edadController,
                  decoration: const InputDecoration(labelText: 'Edad'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: especialistaController,
                  decoration: const InputDecoration(labelText: 'Especialista'),
                ),
                TextField(
                  controller: premiumController,
                  decoration: const InputDecoration(labelText: 'Premium (Yes/No)'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _pacientList[index] = PacientItem(
                    id: int.tryParse(idController.text) ?? 0 ,
                    nombre: nombreController.text,
                    apellido_m: apellidoMController.text,
                    apellido_p: apellidoPController.text,
                    edad: int.tryParse(edadController.text) ?? 0,
                    especialista: especialistaController.text,
                    premium: premiumController.text,

                    
                  );
                });
                Actualizarpaciente ap=Actualizarpaciente(id: int.parse(idController.text), nombre: nombreController.text, apellido_p: apellidoPController.text, apellido_m: apellidoMController.text, edad: int.parse(edadController.text), premium: (premiumController.text=="si")? 1:0, context: context);
                ap.ActualizarDatos();
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}


class PacientItem {
  String nombre, apellido_m, apellido_p, especialista, premium;
  int id,edad;

  PacientItem({
    required this.id,
    required this.nombre,
    required this.apellido_m,
    required this.apellido_p,
    required this.edad,
    required this.especialista,
    required this.premium,
  });
}


