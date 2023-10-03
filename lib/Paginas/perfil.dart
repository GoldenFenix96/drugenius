import 'package:drugenius/Paginas/drug_input.dart';
import 'package:drugenius/Paginas/nav_bar.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  void main() {
    runApp(const MaterialApp(home: Perfil()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 253, 200, 66),
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
                            'https://i.ibb.co/bvgjvQs/Yo.jpg',
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
                        child: const TextField(
                          keyboardType: TextInputType.text,
                          obscureText: false,
                        ),
                      ),
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
                        child: const TextField(
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
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
                        child: const TextField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
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
