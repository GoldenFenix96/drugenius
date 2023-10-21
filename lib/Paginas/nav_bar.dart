import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugenius/Clases/id_usuarios.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:drugenius/Paginas/blank_page.dart';
import 'package:drugenius/Paginas/configuracion.dart';
import 'package:drugenius/Paginas/farmacocinetica.dart';
import 'package:drugenius/Paginas/generalidades.dart';
import 'package:drugenius/Paginas/list_medicamentos.dart';
import 'package:drugenius/Paginas/perfil.dart';
import 'package:drugenius/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

String? userId = UserStateManager().userId;

class _NavBarState extends State<NavBar> {
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
      // Obtén el usuario actualmente autenticado
      final User? user = FirebaseAuth.instance.currentUser;
      // Verifica que userId no sea nulo antes de usarlo
      if (user != null) {
        userId = user.uid;
        DocumentSnapshot<Object?> usuarioSnapshot = await fs.getUsuarioPorId(
            userId!); // Agrega el operador '!' aquí para indicar que userId no es nulo
        if (usuarioSnapshot.exists) {
          final data = usuarioSnapshot.data() as Map<String, dynamic>?;

          if (data != null) {
            setState(() {
              nombre = data['Nombre'] ?? '';
              correo = data['Correo'] ?? '';
            });
          } else {
            print('El documento no contiene datos.');
          }
        } else {
          print('El usuario con ID $userId no existe.');
        }
      }
    } catch (e) {
      print('Error al cargar datos del usuario: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(nombre),
            accountEmail: Text(correo),
            currentAccountPicture: const CircleAvatar(
              radius: 52,
              backgroundImage:
                  NetworkImage("https://i.ibb.co/JQ2sqXr/equipo-medico.png"),
            ),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 41, 130, 172),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.unibe.edu.do/wp-content/uploads/2018/12/medicina-familiar-unibe.jpg"),
                    fit: BoxFit.fill)),
          ),
          buildMenuItem(
            text: "Inicio",
            icon: Icons.home,
            onClicked: () => selectedItem(context, 0),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Generalidades",
            icon: Icons.bloodtype,
            onClicked: () => selectedItem(context, 1),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Medicamentos",
            icon: Icons.medication_liquid_outlined,
            onClicked: () => selectedItem(context, 2),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Farmacocinética",
            icon: Icons.healing_outlined,
            onClicked: () => selectedItem(context, 3),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Videos y Podcasts",
            icon: Icons.ondemand_video_outlined,
            onClicked: () => selectedItem(context, 4),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Evaluaciones",
            icon: Icons.quiz_outlined,
            onClicked: () => selectedItem(context, 5),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Juegos",
            icon: Icons.sports_esports_outlined,
            onClicked: () => selectedItem(context, 6),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Calculadora de Dosis",
            icon: Icons.calculate_outlined,
            onClicked: () => selectedItem(context, 7),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Foro de Discusión",
            icon: Icons.forum_outlined,
            onClicked: () => selectedItem(context, 8),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Perfil",
            icon: Icons.account_circle,
            onClicked: () => selectedItem(context, 9),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Configuración",
            icon: Icons.settings,
            onClicked: () => selectedItem(context, 10),
          ),
        ],
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = Color.fromARGB(255, 0, 0, 0);
  const hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: const TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    //Home
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const DrugeniusMenu(), // Reemplaza con la pantalla deseada
        ),
      );
      break;
    //Generalidades
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const generalidades(), // Reemplaza con la pantalla deseada
        ),
      );
      break;
    //Medicamentos
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ListMedicamentos(), // Reemplaza con la pantalla deseada
        ),
      );
      break;
    //Farmacocinética
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const Farmacocinetica(), // Reemplaza con la pantalla deseada
        ),
      );
      break;
    //Videos y Podcasts
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const BlankPage(), // Reemplaza con la pantalla deseada
        ),
      );
      break;
    //Evaluaciones
    case 5:
      Navigator.push(
        context,
        MaterialPageRoute(
          //builder: (context) => Prueba(), // Reemplaza con la pantalla deseada
          builder: (context) => BlankPage(),
        ),
      );
      break;
    //Juegos
    case 6:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const BlankPage(), // Reemplaza con la pantalla deseada
        ),
      );
      break;
    //Calculadora de Dosis
    case 7:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const BlankPage(), // Reemplaza con la pantalla deseada
        ),
      );
      break;
    //Foro de Discusión
    case 8:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const BlankPage(), // Reemplaza con la pantalla deseada
        ),
      );
      break;
    //Perfil
    case 9:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const Perfil(), // Reemplaza con la pantalla deseada
        ),
      );
      break;
    //Configuración
    case 10:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const Configuracion(), // Reemplaza con la pantalla deseada
        ),
      );
      break;
  }
}
