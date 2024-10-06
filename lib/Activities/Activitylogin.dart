import 'package:flutter/material.dart';
import 'package:paginadiabeticsolution/Functions/login.dart';
import 'package:paginadiabeticsolution/theme/app_theme.dart';

class Activitylogin extends StatelessWidget {
  TextEditingController txtcorrreo= TextEditingController();
  TextEditingController txtcontrasena=TextEditingController();
   Activitylogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar Sesion"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("data"),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topCenter,
        decoration: fondoGradiente,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                Image.asset("letraslogin.png", scale: 6,),
                SizedBox(height: 12,),
                Container(
                  width: 550,
                  height: 230,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), ),
                  child: Column(
                    children: [
                      Column(
                        children: [ 
                          SizedBox(height: 25,),
                          Center(                          
                          child: Padding(
                            padding: EdgeInsets.only(left:  25, right: 25),
                            child: CustomTextField(controller: txtcorrreo, labelText: "Correo")),
                        ),
                        SizedBox(height: 25,),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: CustomTextField(controller: txtcontrasena, labelText: "contraseña"),
                                                 
                            ),                                                     
                        ),
                        SizedBox(height: 25,),
                        CustomButton(text: "Iniciar Sesion", onPressed: (){
                          if (txtcontrasena.text.isNotEmpty && txtcorrreo.text.isNotEmpty){
                            print("entrando a login");
                            login l=login(contrasena: txtcontrasena.text, correo: txtcorrreo.text, context: context);
                            l.inSesion();
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("debes de llenar todos los campos!!")));
                          }
                        }),
                        
                        
                        ]
                      )
                    ],
                  ),
                ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
