import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugenius/Clases/id_usuarios.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:drugenius/Paginas/drug_input.dart';
import 'package:drugenius/Paginas/nav_bar.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _Perfil();
}

String? userId = UserStateManager().userId;

class _Perfil extends State<Perfil> {
  Firebase_services fs = Firebase_services();
  String nombre = '';
  String correo = '';
  String contrasena = '';

  @override
  void initState() {
    super.initState();
    cargarDatosUsuario();
  }

  Future<void> cargarDatosUsuario() async {
    try {
      // Verifica que userId no sea nulo antes de usarlo
      if (userId != null) {
        DocumentSnapshot<Object?> usuarioSnapshot = await fs.getUsuarioPorId(
            userId!); // Agrega el operador '!' aquí para indicar que userId no es nulo
        if (usuarioSnapshot.exists) {
          final data = usuarioSnapshot.data() as Map<String, dynamic>?;

          if (data != null) {
            setState(() {
              nombre = data['Nombre'] ?? '';
              correo = data['Correo'] ?? '';
              contrasena = data['Contraseña'] ?? '';
            });
          } else {
            print('El documento no contiene datos.');
          }
        } else {
          print('El usuario con ID $userId no existe.');
        }
        // Resto del código aquí...
      }
    } catch (e) {
      print('Error al cargar datos del usuario: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 85, 145, 214),
          elevation: 0,
          title: Image.network(
            'https://i.ibb.co/0FZPjNw/Logo-Drugenius.png', // URL de la imagen en internet
            width: 300, // Ancho de la imagen
            height: 200, // Altura de la imagen
          ),
        ),
        drawer: const NavBar(),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(253, 200, 66, 0.143),
                ],
                stops: [0.1, 0.9],
              ),
            ),
            child: ListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              75), // Ajusta el radio según tu necesidad
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(
                                  255, 135, 201, 206), // Color de la sombra
                              blurRadius:
                                  10.0, // Radio de difuminado de la sombra
                              offset: Offset(0,
                                  2), // Desplazamiento de la sombra (eje x, eje y)
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              75), // Ajusta el radio según tu necesidad
                          child: Image.network(
                            'https://i.ibb.co/JQ2sqXr/equipo-medico.png',
                            width: 150, // Ancho de la imagen
                            height: 150, // Alto de la imagen
                            fit: BoxFit
                                .cover, // Ajusta la forma en que la imagen se ajusta dentro del contenedor
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10.0, 40.0, 0),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Nombre:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(40, 0.0, 40.0, 0),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            controller: TextEditingController(text: nombre),
                          )),
                      const SizedBox(height: 20.0),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10.0, 40.0, 0),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Correo Electrónico:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0.0, 40.0, 0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          controller: TextEditingController(text: correo),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10.0, 40.0, 0),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Contraseña:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0.0, 40.0, 0),
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: TextEditingController(text: contrasena),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                          onPressed: () {
                            // Acción cuando se presiona el botón
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DrugInput(), // Reemplaza con la pantalla deseada
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: const Color.fromARGB(
                                255, 14, 26, 138), // Color de fondo
                            padding: const EdgeInsets.all(10),
                            elevation: 10,
                          ),
                          child: const Text("Actualizar Datos")),
                    ],
                  ),
                )
              ],
            )));
  }
}
